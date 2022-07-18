jQuery(document).ready(function() {
	jQuery(document).on('keypress','input[name=pay_fee]',function( e ) {
		if ( e.which == 13 ) {
			update_floats();
		}
	});
	jQuery(document).on('blur','input[name=pay_fee]',function() {
		update_floats();
	});

	if ( jQuery('#distributor').length>0 ) {
		jQuery('#payout').click(function(e) {
			var min = jQuery(this).attr('data-min');
			var bal = jQuery(this).attr('data-bal');

			if ( parseFloat(bal) < parseFloat(min) ) {
				jQuery(this).next().text( 'Minimum payout amount: P ' + min );
				e.preventDefault();
			}
		});
	} // #distributor

	if ( jQuery('#withdraw').length>0 ) {
		jQuery(document).on('change','#check_all',function(e) {
			jQuery('#withdraw input[type=checkbox]').prop('checked', jQuery('#check_all').prop('checked'));
			get_all_bonus();
		});

		jQuery(document).on('change','#withdraw input:not(#check_all)',function(e) {
			jQuery('#check_all').prop('checked', false);
			get_all_bonus();
		});

		jQuery('#to_withdraw').click(function(e) {
			var wid_set = jQuery(this).attr('data-to_withdraw');
			var wid_min = jQuery(this).attr('min');

			if ( parseFloat(wid_min) > parseFloat(wid_set) ) {
				jQuery(this).siblings('span').addClass('bad').text( 'Minimum withdrawal of ' + wid_min );
			} else {
				if ( confirm('Would you like to withdraw P' + format_float(wid_set) + '?') ) {
					jQuery('form').submit();
				}
			}
			e.preventDefault();
		});

		jQuery('#max_wid').click(function(e) {
			jQuery('input[name=amount]').val( jQuery(this).text() );
			e.preventDefault();
		});
	}

	if ( jQuery('#manage_withdraw').length>0 ) {
		jQuery('#manage_withdraw').submit(function(e) {
			if ( !confirm('Approve and release this request?') ) {
				e.preventDefault();
			}
		});
	}

	if ( jQuery('#batch_withdraw').length>0 ) {
		jQuery('#batch_withdraw').submit(function() {
			if ( jQuery('#batch_withdraw input[type=checkbox]:checked').length<1 ) {
				jQuery('#bottom_nav span').addClass('bad').text('Nothing selected ');
				return false;
			}
		});
	}


	if ( jQuery('#rundc').length>0 ) {
		jQuery('#rundc').click(function() {
			if ( !confirm( 'Fill-in ALL EMPTY Discount Codes?' ) ) {
				return false;
			}
		});
	}

	if ( jQuery('#profile').length>0 ) {
		var ischanged = 0;
		jQuery(".datepicker").datepicker({
			altField: '#altField',
			altFormat:'mmddyy',
			changeMonth: true,
			changeYear: true,
			dateFormat:"MM dd, yy",
			firstDay: 0,
			yearRange: "-100:+0",
			onChangeMonthYear: function (year, month) {
				if (!ischanged) {
					ischanged = 1;
					jQuery(this).datepicker( "setDate", new Date(year, month-1, 1) );
					ischanged = 0;
				}
		     },
			onSelect:function(n) {
				jQuery(this).datepicker('option','altField',jQuery(this).next());
			}
		});

		jQuery('select[name=payout]').change(function() {
			var qr  = jQuery('select[name=payout] :selected').attr('data-QR');
			var sel = jQuery('select[name=payout] :selected').val();

			jQuery('.qrcode').addClass('hide');
			jQuery('input[type=file]').next().text('');
			jQuery('input[type=file]').val('').addClass('hide');

			if ( sel>1 ) {
				jQuery('.qrcode').removeClass('hide');
				if ( qr!='' ) {
					jQuery('.qrcode img').removeClass('hide').attr('src', luckyAjax.qr_url+qr);
					jQuery('.qrnote').addClass('hide');
				} else {
					jQuery('.qrcode img').addClass('hide');
					jQuery('input[type=file]').removeClass('hide');
					jQuery('.qrnote').removeClass('hide');
				}
			}
		});

		jQuery('.qrcode img').click(function() {
			jQuery('input[type=file]').click();
		});

		jQuery('input[type=file]').change(function() {
			jQuery(this).next().text('');
			var $valid = /jpg|png|bmp|gif/;

			if ( !jQuery(this).val().match($valid) ) {
				jQuery(this).next().text('Invalid image file');
				jQuery(this).val('');
			} else{
				jQuery('.qrcode img').addClass('hide');
				jQuery(this).show();
			}
		});

		jQuery('#profile input[name=dssid]').blur(function() {
			if ( !jQuery(this).prop('readonly') ) {
				var src = jQuery(this);
				if ( src.val()!='' ) {
					modal.open({content:'<ul id="distri_list"></ul>'});
					list_distributors(src);
				}
			}
		});

		jQuery('#profile .dashicons-search').click(function() {
			var src = jQuery("#profile input[name=dssid]");
			if ( src.val()!='' ) {
				modal.open({content:'<ul id="distri_list"></ul>'});
				list_distributors(src);
			}
		});

		jQuery('#generate_discount').click(function() {
			jQuery.ajax({
				type: 'POST',
                    url: luckyAjax.hash_url,
				beforeSend: function() { jQuery('input[name=discount]').val('generating...'); },
				data: 'hash=1&id=' + jQuery('input[name=dsdid]').val(),
				success: function(n) {
					jQuery('input[name=discount]').val(n);
				}
			});
		});

		jQuery('#profile input[name=dsstatus]').click(function() {
			if ( jQuery('#profile input[name=dsstatus]:checked').length<1 ) {
				if ( confirm('To completely disable this account, Discount Code must be removed. Remove Discount Code?') ) {
					jQuery('#profile input[name=discount]').val('');
				}
			} else {
				if ( confirm('Generate NEW Discount Code after enabling the account?') ) {
					jQuery('#generate_discount').click();
				}
			}
		});

	} // #profile

	if ( jQuery('#agree_privacy').length>0 ) {
		jQuery(document).on('change','#agree_privacy',function(e) {
			jQuery('#profile input[type=submit]').prop('disabled', !jQuery('#agree_privacy').prop('checked'));
		});

		jQuery(document).on('submit','#profile',function(e) {
			if ( !jQuery('#agree_privacy').prop('checked') ) {
				alert('You must agree to the Privacy Policy to continue.');
				e.preventDefault();
			}
		});
	} // #agree_privacy

	if ( jQuery('#admin_user').length>0 ) {

		var mins = jQuery('#admin_user').attr('data-reload');

		setInterval(function() {
			jQuery('#admin_user').text('Reloading... Please wait.');
			window.location.reload();
		}, (mins * 60 * 1000) );

	} // #admin_user

	if ( jQuery('#admin_upload').length>0 ) {
		jQuery('input[type=file]').change(function() {
			jQuery(this).next().text('');
			var $valid = /csv/;

			if ( !jQuery(this).val().match($valid) ) {
				jQuery(this).next().text('INVALID FILE');
				jQuery(this).val('');
			}
		});
	} //  #admin_upload

	if ( jQuery('#assemble').length>0 ) {
		jQuery('select').change(function() {
			var pak = jQuery('select[name=package] :selected').val();
			var stk = jQuery('select[name=stockist] :selected').val();
			window.location = '?add&package=' + pak + '&warehouse=' + stk;

		});
	} //  #assemble

	if ( jQuery('#product_list').length>0 ) {
		updateCartTotals(null);

		jQuery('#product_list .cart_qty').click(function() {
			jQuery(this).select();
		});

		jQuery('#product_list .cart_qty').change(function() {
			jQuery(this).blur();
		});

		jQuery('#product_list .cart_qty').blur(function() {
			jQuery('.total_msg').text('computing...');
			jQuery(this).val( Math.floor( jQuery(this).val() ) );
			updateCartTotals(jQuery(this));

			jQuery.ajax({
				type: 'POST',
				url: luckyAjax.update_cart,
				data: 'item=' + jQuery(this).attr('name') + '&qty=' + jQuery(this).val() + '&pov=' + jQuery(this).attr('data-pov') + '&price=' + jQuery(this).attr('data-price'),
				success: function(n) {
				}
			});
		});

		jQuery('#apply_discount').click(function() {
			var msg = jQuery(this).next();

			if ( jQuery('#discount_code').val()=='' ) {
				msg.text('Enter discount code').addClass('bad');
			} else {
				jQuery.ajax({
					type: 'POST',
					url: luckyAjax.test_discount,
					beforeSend: function() {
						msg.text('validating...').removeClass('bad');
						jQuery('.total_msg').text('computing...');
						jQuery('#product_list .cart_qty').blur();
					},
					data: 'code=' + jQuery('#discount_code').val() + '&' + jQuery('#product_list').serialize(),
					success: function(n) {
						if(n>0) { location.reload(); }
						else{
							msg.text('DISCOUNT CODE INVALID').addClass('bad');
							jQuery('.total_msg').text('');
							jQuery('.discounted').remove();
							updateCartTotals(null);
						}
					}
				});
			}
		});

		jQuery(document).on('keypress','#discount_code',function( e ) {
			if ( e.which == 13 ) {
				jQuery('#apply_discount').click();
				e.preventDefault();
			}
		});

		jQuery(document).on('click','#clear_cart',function( e ) {
			jQuery.ajax({
				type: 'POST',
				url: luckyAjax.update_cart,
				data: 'clear_cart=1',
				beforeSend: function() { jQuery('#clear_cart').before('<span class="smaller">clearing... </span>'); },
				success: function(n) {
					location.reload();
				}
			});
			e.preventDefault();
		});
	} // #product_list

	if ( jQuery('#stockist_orders').length>0 ) {
		jQuery('input[type=submit]').click(function() {
			jQuery(this).prop('disabled', true);
		});

		jQuery(".datepicker").datepicker({
				altField: '#altField',
				altFormat:'yy-mm-dd',
				changeMonth: true,
				changeYear: true,
				dateFormat:"MM dd, yy",
				firstDay: 0,
				yearRange: "-1:+0",
				onSelect:function(n) {
					jQuery(this).datepicker('option','altField',jQuery(this).next());
			}
		});

		jQuery(document).on('change','#item_list input',function(e) {

			if ( jQuery(this).prop('checked') ) {
				updateStockistCart( jQuery(this).prop('id'), jQuery(this).attr('data-name'), 1, parseInt(jQuery(this).attr('data-stock')), parseFloat(jQuery(this).attr('data-pov')), parseFloat(jQuery(this).attr('data-price')));
				jQuery( 'li.' + jQuery(this).prop('id') ).find('.item_qty').focus();

			} else {
				jQuery('#order_list li.' + jQuery(this).prop('id') + ' .item_qty').val(0);
				jQuery('#order_list .item_qty').change();
			}
		});

		jQuery(document).on('change','#order_list .item_code',function(e) {
			var dis = jQuery('#item_list #' + jQuery(this).val() );
			var dat = jQuery(this).parent().siblings().find('.item_qty');

			if ( jQuery(this).val().length == 5 ) {
				if ( dis.length>0 ) {
					jQuery(this).parent().parent().addClass( jQuery(this).val() );
					jQuery(this).parent().next().text( dis.attr('data-name') );
					dat.attr( 'data-price', dis.attr('data-price') );
					dat.attr( 'data-stock', dis.attr('data-stock') );
					dat.attr( 'data-pov', dis.attr('data-pov') );
					dat.val( dat.val()=='' ? 1 : dat.val() );

					updateStockistCart( jQuery(this).val(), dis.attr('data-name'), dat.val(), dat.attr('data-stock'), dat.attr('data-pov'), dat.attr('data-price') );
					jQuery( 'li.' + jQuery(this).val() ).find('.item_qty').focus();

				} else {
					jQuery(this).parent().next().text('Unavailable');
					jQuery('#order_list .item_qty').change();
				}

			} else {
				jQuery(this).parent().next().text('Invalid Code');
				jQuery('#order_list .item_qty').change();
			}
		});

		jQuery(document).on('change','#order_list .item_qty',function(e) {
			var dis = jQuery(this).parent().siblings().find('.item_code');
			var stk = parseInt(jQuery(this).attr('max'));

			if ( dis.val() == '' ) {
				e.preventDefault();
				jQuery(this).val(0);
			}

			if ( parseInt(jQuery(this).val()) > stk ) {
				if ( stk ) alert('Max of ' + stk + ' only');
				e.preventDefault();
				jQuery(this).val(stk);
			}

			updateStockistCart( dis.val(), dis.parent().next().text(), jQuery(this).val(), stk, jQuery(this).attr('data-pov'), jQuery(this).attr('data-price') );
			jQuery( this ).parent().parent().next().find('.item_code').focus();
		});

		jQuery(document).on('keypress','#stockist_orders input[name=referrer]',function( e ) {
			if ( e.which == 13 ) {
				jQuery(this).parent().next().find('input').focus();
				e.preventDefault();	//disable form submit on ENTER
			}
		});

		jQuery('#stockist_orders input[name=referrer]').blur(function() {
			if ( !jQuery(this).prop('readonly') ) {
				var src = jQuery(this);

				if ( src.val()!='' ) {
					modal.open({content:'<ul id="distri_list"></ul>'});
					list_distributors(src);
				}
			}
		});

		jQuery('.orders input[type=submit]').click(function(e) {
			var dis = jQuery('#order_list .item_code');
			var next = jQuery('#stockist_orders input[type=submit]').next().next();

			if ( dis.length==1 && dis.val()=='' ) {
console.log(8);
				next.addClass('bad').text( 'No item selected.' );
				jQuery('input[type=submit]').prop('disabled', false);
				e.preventDefault();

			} else if( isNaN( jQuery('#stockist_orders input[name=referrer]').val() ) ) {
console.log(9);
				next.addClass('bad').text( 'Invalid Distributor ID.' );
				jQuery('input[type=submit]').prop('disabled', false);
				e.preventDefault();

			} else {
				jQuery('.orders form').submit();
			}
		});

		jQuery('.reorders input[type=submit]').click(function(e) {
			var dis = jQuery('#order_list .item_code');
			var next = jQuery('#stockist_orders input[type=submit]').next().next();
			var from = jQuery('.reorder_from').val();

			if ( dis.length==1 && dis.val()=='' ) {
				next.addClass('bad').text( 'No item selected.' );

			} else if (from == null ) {
				alert('Unable to continue. No warehouse selected.');

			} else {
				var dos = jQuery(this).val();

				if (confirm( dos  + ' reorder?')) {
					jQuery('.reorders form').submit();
				}
			}

			jQuery('input[type=submit]').prop('disabled', false);
			e.preventDefault();
		});

	} // #stockist_orders

	if ( jQuery('.stockist').length>0 ) {
		jQuery('input[name=oic]').blur(function() {
			var src = jQuery(this);
			if ( src.val()!='' ) {
				modal.open({content:'<ul id="distri_list"></ul>'});
				list_distributors(src);
			}
		});
	}

	if ( jQuery('#item_list').length>0 ) {
		var stat = true;
		close_list();

		jQuery(document).on('click','#item_list h5',function(e) {
			switch (stat) {
				case true:
					open_list();
					break;
				case false:
					close_list();
					break;
			}

			stat = !stat;
		});
	} // #item_list

	if ( jQuery('#search_distributors,#distri_list.registration').length==0 ) {
		jQuery(document).on('click','#distri_list li',function(e) {
			jQuery('input[name=oic],input[name=dssid],input[name=referrer]').val(jQuery(this).children('*:first-child').text());
			jQuery('input[name=oic],input[name=dssid],input[name=referrer]').next().text(jQuery(this).children('span:nth-child(3)').text());

			if ( jQuery('#oic_id').length>0 ) {
				jQuery('select[name=upline]').focus();
			}

			modal.close();
			e.preventDefault();
		});
	}

	if ( jQuery('#snc').length>0 ) {
		jQuery('#snc .qty').blur(function(e) {
			run_snc( jQuery(this), e );
		});

		jQuery('#snc a').click(function(e) {
			return run_snc( jQuery(this).prev(), e);
		});

		jQuery('#snc .smaller').click(function(e) {
			jQuery(this).prev().prev().val( jQuery(this).attr('max') );
		});
	} // #snc

	if ( jQuery('#addtocart').length>0 ) {
		jQuery('#addtocart').click(function(e) {
			jQuery.ajax({
				type: 'POST',
				url: luckyAjax.update_cart,
				beforeSend: function() { jQuery('#addtocart').prev().text('+1 '); },
				data: 'item=' + jQuery(this).attr('data-code') + '&price=' + jQuery(this).attr('data-price') + '&pov=' + jQuery(this).attr('data-pov') + '&addtocart=1',
				success: function(n) {
					jQuery('#addtocart').prev().text('');
				}
			});

			e.preventDefault();
		});
	} // #addtocart

	if ( jQuery('#checkout_order').length>0 ) {
		update_floats();

		jQuery(".datepicker").datepicker({
				altField: '#altField',
				altFormat:'mmddyy',
				changeMonth: true,
				changeYear: true,
				dateFormat:"MM dd, yy",
				firstDay: 1,
				yearRange: "-1:+0",
				onSelect:function(n) {
					jQuery(this).datepicker('option','altField',jQuery(this).next());
			}
		});

		jQuery('#use_details').click(function() {
			var dis = jQuery(this);

			if ( dis.prop('checked') ) {
				jQuery('input[name=del_receiver]').val(dis.attr('data-receiver'));
				jQuery('textarea[name=del_address]').text(dis.attr('data-address'));
				jQuery('input[name=del_contact]').val(dis.attr('data-contact'));
				jQuery('select[name=pay_out]').val(dis.attr('data-pay'));
			} else {
				jQuery('input[name=del_receiver]').val('');
				jQuery('textarea[name=del_address]').text('');
				jQuery('input[name=del_contact]').val('');
				jQuery('select[name=pay_out]').val(0);
			}
		});

		jQuery('#save_details').click(function() {
			if ( jQuery('#save_details').prop('checked') && confirm('Save info for your next order?')) {
				jQuery.post( luckyAjax.load_customer, { save: true, dbp: jQuery('#save_details').attr('data-extra'), lastid: jQuery('#save_details').attr('data-lastid') }, function( n ) {
					n = '<div class="rt"><a href="#" class="smaller" id="close">CLOSE</a></div>' +n;
					modal.open({content:n});

					jQuery('input[name=receiver]').val( jQuery('input[name=del_receiver]').val() );
					jQuery('textarea[name=address]').text( jQuery('textarea[name=del_address]').val() );
					jQuery('input[name=contact]').val( jQuery('input[name=del_contact]').val() );
					jQuery('select[name=pay_out]').val( jQuery('select[name=pay_out]').val() );
				});
			}
		});

		jQuery('select[name=pay_out]').change(function() {
			var qr  = jQuery('select[name=pay_out] :selected').attr('data-QR');
			var sel = jQuery('select[name=pay_out] :selected').val();

			jQuery('.qrcode').addClass('hide');

			if ( sel>1 && sel<99 ) {
				jQuery('.qrcode').removeClass('hide');
				if ( qr!='' ) {
					jQuery('.qrcode img').removeClass('hide').attr('src', luckyAjax.qr_url+qr);
					jQuery('.qrnote').removeClass('hide');
				} else {
					jQuery('.qrcode img').addClass('hide');
					jQuery('.qrnote').addClass('hide');
				}
			}

		});

		jQuery(document).on('submit', '#update_customers', function( e ) {
			var sub = jQuery('#update_customers input[type=submit]');

			jQuery.ajax({
				type: 'POST',
				url: luckyAjax.save_customer,
				beforeSend: function() {
					sub.next().text('validating...');
				},
				data: jQuery('#update_customers').serialize(),
				success: function(n) {
					sub.next().text(n);
					if ( n.indexOf('used')>=0) {
						sub.next().addClass('bad');
					} else {
						jQuery('input[name=del_receiver]').val( jQuery('input[name=receiver]').val() );
						jQuery('textarea[name=del_address]').val( jQuery('textarea[name=address]').val() );
						jQuery('input[name=del_contact]').val( jQuery('input[name=contact]').val() );
						jQuery('#checkout_order select[name=pay_out]').val( jQuery('#update_customers select[name=pay_out]').val() ).trigger('change');
						jQuery('#save_details').attr('data-lastid', jQuery('#update_customers input[name=id]').val() );
						jQuery('input[name=customer_id]').val( jQuery('#update_customers input[name=id]').val() );

						modal.close();
					}
				}
			});
			e.preventDefault();
		});

	} // #checkout_order

	if ( jQuery('#stock_transfer').length>0 ) {

		jQuery('input[type=submit]').click(function() {
			jQuery(this).prop('disabled', true);
		});

		jQuery('#transfer_from').change(function(e) {
			var t_fr = jQuery(this).val();
			window.location = '?add&' + t_fr;
		});

		jQuery('#transfer_to').change(function(e) {
			var h_o  = jQuery('#stock_transfer').attr('data-head-office');
			var t_to = jQuery(this).val();

			if( t_to == 'STOCK OUT' ) {
				window.location = '?add&' + h_o + '&out' ;
			}

		});

		jQuery('input[type=submit]').click(function(e) {
			var t_fr = jQuery('#transfer_from').val();
			var t_to = jQuery('select[name=transfer_to] :selected').val();
			var bad = 0;

			if ( jQuery('select[name=transfer_to]').length>0 ) {
				var cnt = jQuery('.qty').filter(function() {
					return this.value.trim() >0;
				}).length;

				if ( !cnt ) {
					alert( 'Unable to continue. No item selected.' );
					bad = 1;

				} else if ( t_fr == t_to ) {
					alert( 'Unable to continue. Same warehouse selected.' );
					bad = 1;

				} else if ( t_to == '' ) {
					alert( 'Unable to continue. No warehouse selected.' );
					bad = 1;

				} else {
					jQuery('input[type=submit]').prop('disabled', false);
					if( !confirm('Are you sure you want to ' + jQuery(this).val() + '?' ) ) {
						e.preventDefault();
					}
				}

			}

			jQuery('input[type=submit]').prop('disabled', false);

			if ( bad ) {
				e.preventDefault();
			}

		});

		jQuery(document).on('change', '#stock_transfer .qty', function( e ) {
			jQuery(this).parent().next().text( format_float(addCommas(parseInt(jQuery(this).val()) * parseFloat(jQuery(this).attr('data-dp')))) );

			var dp = 0;
			jQuery('.amt_dp').each(function() {
				dp += parseFloat(jQuery(this).text().replace(/\,/g,''));
			});

			jQuery('#total_dp').text( format_float(addCommas(dp)) );
		});

	} // #stock_transfer

	if ( jQuery('.dashicons-privacy').length>0 ) {
		jQuery('.dashicons-privacy').click(function() {
			var dis = jQuery('.dashicons-privacy');
			var v   = 'un';
			var w   = 'pw';
			var msg = 'generated';

			switch (jQuery('input[name=action]').val()) {
				case 'update_profile':
					var v = 'dsdid';
					var w = 'dsbirth';
					var msg = 'reset';
						break;
				case 'update_stockist':
					var v = 'id';
						break;
				default:
			}

			if ( jQuery('input[name='+ w +']').val() != '' ) {
				jQuery.ajax({
					type: 'POST',
	                    url: luckyAjax.gen_pass,
					beforeSend: function() { dis.next().text('generating...'); },
					data: 'un=' + jQuery('input[name='+ v +']').val() + '&pw=' + jQuery('input[name='+ w +']').val(),
					success: function(n) {
						jQuery('input[name=pw]').val(n);
						dis.next().text('password ' + msg );
					}
				});
			} else dis.next().text('INVALID. password empty.');
		});
	} // #pw

	if ( jQuery('#submit_survey').length>0 ) {
		jQuery('#submit_survey').submit(function(e) {
			jQuery('#submit_survey .btn').after(' <span class="smaller">submitting...</span>');
			jQuery.post( luckyAjax.submit_survey, jQuery('#submit_survey').serialize(), function( n ) {
				jQuery('#submit_survey').empty().html(n);
			});
			e.preventDefault();
		});
	} // #submit_survey

	if ( jQuery('#backtotop').length>0 ) {
		jQuery('#backtotop,#godown').hide();

		// Check to see if the window is top if not then display button
		jQuery(window).scroll(function() {
			// Show button after 100px
			var scroll = jQuery(window).scrollTop() + jQuery(window).height();

			if ( jQuery(this).scrollTop() == 0 ) {
				jQuery('#backtotop').fadeOut();

			} else if ( scroll.toFixed() == jQuery(document).height() ) {
				jQuery('#godown').fadeOut();

			} else {
				jQuery('#backtotop').fadeIn();
				jQuery('#godown').fadeIn();
			}

		});

		// Click event to scroll to top
		jQuery('#backtotop').click(function() {
			jQuery('html,body').animate( {scrollTop : 0}, 800);
			return false;
		});

		jQuery(document).on('click','#godown',function(e) {
			jQuery('html,body').animate( {scrollTop : jQuery(document).height()}, 800);
			return false;
		});

	}

	jQuery(document).on('keypress','#search_box',function( e ) {
		if ( e.which == 13 ) {
			list_distributors(jQuery(this));
		}
	});

	jQuery(document).on('click','.accepted_formats',function() {
		jQuery.post( luckyAjax.phone_formats, function( n ) {
			modal.open({content:n});
		});
		return false;
	});

	jQuery(document).on('click','#search_distributors .dashicons-search',function() {
		list_distributors(jQuery("#search_box"));
	});

	jQuery(document).on('change','.byDate',function() {
		window.location = jQuery('.byDate :selected').val();
		jQuery(this).parent().prepend(' <span class="smaller">Loading...</span> ');
	});

	jQuery(document).on('change','#stockist_list',function() {
		window.location = jQuery('#stockist_list :selected').val();
		jQuery(this).prev().prepend(' <span class="smaller">Loading...</span> ');
	});

	jQuery(document).on('click','.link',function() {
          window.location = jQuery(this).attr('href');
     });

	jQuery(document).on('click','#close',function() {
		modal.close();
     });

	jQuery(document).on('submit','form',function(e) {
console.log(jQuery('form').serialize());
		// jQuery('form').submit();
		// e.preventDefault();
    });

});

function open_list() {
	jQuery('#item_list h5').attr('title','Click to close').addClass('on');
	jQuery('#item_list').animate( {width:400}, 100, function() {
		jQuery('#item_list ul,#add_freebies').show(100);
	});
}

function close_list() {
	jQuery('#item_list h5').attr('title','Click to open').removeClass('on');
	jQuery('#item_list').animate( {width:40}, 100, function() {
		jQuery('#add_freebies').hide(100);
	});
	jQuery('#item_list ul').hide();
}

function list_distributors(src) {
	if (src.val()!='') {
		jQuery.ajax({
			type: 'POST',
			url: luckyAjax.list_distri,
			beforeSend: function() {
				src.next().text('');
				jQuery('.rem').remove();
				jQuery('#distri_list').empty().html('<li>searching...</li>');
			},
			data: 'id=' + src.val() + '&src=' + src.attr('name'),
			success: function(n) {
				if ( (~n.indexOf('<li>'))<0 || src.prop('id') == 'search_box' ) {
					jQuery('#distri_list').empty().html(n);

					if ( src.attr('name')!=undefined ) jQuery("#distri_list").attr("tabindex",-1).focus();

					if ( (~n.indexOf('No match'))>=0 ) {
						jQuery('#distri_list').before('<h5 class="rem">Did you mean one of the following?</h5>');

						if ( jQuery(document).height() > jQuery(window).height() )
							jQuery('#godown').fadeIn();

					} else {
						if (src.attr('id')!='search_box') {
							src.next().text('NO MATCH FOUND');
						}
						modal.close();
					}

				} else {
					src.val( n.substr(0, 8) );
					src.next().text( n.substr(8) );
					modal.close();
				}

			},error: function(XMLHttpRequest,textStatus,errorThrown) {
				alert("Error: "+textStatus+" "+errorThrown);
			}
		});
	}
}

function run_snc(obj,e) {
	if ( parseInt(obj.val()) > parseInt(obj.attr('max')) ) {
		alert( 'Unable to continue. You can only order a maximum of ' + obj.attr('max') +'.' );
		e.preventDefault();
	} else {
		jQuery.ajax({
			type: 'POST',
			url: luckyAjax.update_cart,
			data: 'item=' + obj.attr('data-id') + '&qty=' + obj.val() + '&pov=' + obj.attr('data-pov') + '&price=' + obj.attr('data-price'),
			success: function(n) {
			}
		});
		return true;
	}
}

function update_floats() {
	var orders  = jQuery('.order_total').text().toString().replace(/\$|\,/g,'');
	var pay_fee = jQuery('input[name=pay_fee]').val();
	var pay_amt = parseFloat( orders ) + parseFloat( isNaN(pay_fee) ? 0 : pay_fee );
	jQuery('input[name=pay_amount]').val( pay_amt.toFixed(2) );

	var pov = parseFloat(jQuery('input[name=pov]').val());
	jQuery('input[name=pov]').val( pov.toFixed(2) );
}

function get_all_bonus() {
	var total = 0;
	var ids   = '';
	var wid_min = jQuery('#to_withdraw').attr('min');

	jQuery('#to_withdraw').val( '' );
	jQuery('#withdraw_ids').text( '' );
	jQuery('#to_withdraw').siblings('span').removeClass('bad').text( '' );

	jQuery('#withdraw input:not(#check_all):checked').each(function() {
		var i = jQuery(this).attr('data-id');
		var a = jQuery(this).attr('data-amt');

		ids += i + ',';
		total += parseFloat( a.replace(/\,/g,''), 10 );
	});

	jQuery('#withdraw_ids').val( ids );
	jQuery('#withdraw_amt').val( total );
	jQuery('#to_withdraw').attr( 'data-to_withdraw', total );
	jQuery('#to_withdraw').val( 'Withdraw P ' + format_float(total) );

	if ( total < wid_min )
		jQuery('#to_withdraw').siblings('span').addClass('bad').text( 'Minimum withdrawal of ' + wid_min );
}

function addCommas(n) {
    n += '';
    x  = n.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}

function format_float(num) {
	num=num.toString().replace(/\$|\,/g,'');
	if(isNaN(num)) num="0";
	sign=(num==(num=Math.abs(num)));
	num=Math.floor(num*100+0.50000000001);
	cents=num%100;
	num=Math.floor(num/100).toString();
	if(cents<10)
	cents="0"+cents;
	for(var i=0;i<Math.floor((num.length-(1+i))/3);i++)
	num=num.substring(0,num.length-(4*i+3))+','+
	num.substring(num.length-(4*i+3));
	return (((sign)?'':'-')+num+'.'+cents);
}

function updateStockistCart(item,name,qty,stock,pov,price) {
// alert(item + ' | ' + name + ' | ' + qty + ' | ' + stock + ' | ' + pov + ' | ' + price);
	if (item != '') jQuery('#item_list #' + item ).prop( 'checked', qty>0 );

	jQuery.ajax({
		type: 'POST',
		url: luckyAjax.update_cart,
		data: 'stockist=1&item=' + item + '&name=' + encodeURIComponent(name) + '&qty=' + parseInt(qty) + '&stock=' + parseInt(stock) + '&pov=' + parseFloat(pov) + '&price=' + parseFloat(price),
		success: function(n) {
// alert(n);
			jQuery('#order_list li:not(:first-child)').remove();
			jQuery(n).insertAfter('#order_list li:first-child');

			var total_amt = jQuery('#total_amt').text().replace(/\,/g,'');

			jQuery('input[name=pay_amount],.pay_amt').val( total_amt );
			jQuery('input[name=pov]').val( jQuery('#total_amt').attr('data-pov') );
			jQuery('.pay_amt').text( total_amt );

			var min_fee_ok = ( parseInt(total_amt) >= parseFloat(jQuery('.min_fee').attr('data-minfee')) );
			var min_fee = total_amt * ( jQuery('input[name=s_pct]').val() / 100 );
			jQuery('input[name=s_fee]').val( format_float( min_fee_ok ? min_fee :0 ) );

			jQuery('#reorder_due').val( format_float( parseInt( total_amt ) - (min_fee_ok ? min_fee :0) ) );

			jQuery( 'li.' + item ).next().find('.item_code').focus();

		}
	});
}

function updateCartTotals(dis) {
	var total_qty = 0;
	var total_amt = 0;
	var total_dsc = 0;
	var item_price= 0;

	if ( dis != null) {
		var qty = dis.val();
		var amt = dis.parent().prev().text();
		    amt = parseFloat( (amt!=''?amt.replace(/\,/g,''):0), 10 );
		var sav = dis.parent().siblings('.cart_dp').text();
		var total = dis.parent().next();

		total.text( format_float( qty * parseFloat(amt) ) );
		total.siblings('.cart_dsc').text( format_float((sav-amt) * qty) );
	}

	jQuery('.cart_qty').each(function() {
		var q = jQuery(this).val();
		total_qty += parseInt( (q!=''?q:0) );
		item_price = parseFloat(jQuery(this).parent().prev().text());

		jQuery(this).parent().siblings('input:last-of-type').text( format_float( q * item_price ) );
		jQuery(this).parent().siblings('span:nth-last-child(2)').text( format_float( q * item_price ) );
	});

	jQuery('.cart_amt').each(function() {
		var a = jQuery(this).text();
		total_amt += parseFloat( (a!=''?a.replace(/\,/g,''):0), 10 );
	});

	if(jQuery('.cart_dsc').length>0) {
		jQuery('.cart_dsc').each(function() {
			var d = jQuery(this).text();
			total_dsc += parseFloat( (d!=''?d.replace(/\,/g,''):0), 10 );
		});
		jQuery('#total_dsc').text( format_float(total_dsc) );
	}

	jQuery('#total_qty').text( total_qty );
	jQuery('#total_amt').text( format_float(total_amt) );
	jQuery('.total_msg').text('');

}

var modal = (function() {
	var method = {},$overlay,$modal,$content;
	// Center the modal in the viewport
	method.center = function() {
		var top, left;
		top = Math.max(jQuery(window).height() - $modal.outerHeight(), 0) / 2;
		left = Math.max(jQuery(window).width() - $modal.outerWidth(), 0) / 2;
		$modal.css({
			top:top + jQuery(window).scrollTop(),
			left:left + jQuery(window).scrollLeft()
		});
	};

	// Open the modal
	method.open = function(settings) {
		$content.empty().append(settings.content);

		$modal.css({
			width: settings.width || 'auto',
			height: settings.height || 'auto'
		});

		method.center();
		jQuery(window).bind('resize.modal', method.center);
		$modal.show();
		$overlay.show();
	};

	// Close the modal
	method.close = function() {
		$modal.hide();
		$overlay.hide();
		$content.empty();
		jQuery(window).unbind('resize.modal');
	};

	// Generate the HTML and add it to the document
	$overlay = jQuery('<div id="overlay"></div>');
	$modal = jQuery('<div id="modal"></div>');
	$content = jQuery('<div id="content"></div>');

	$modal.hide();
	$overlay.hide();
	$modal.append($content);

	jQuery(document).ready(function() {
		jQuery('body').append($overlay, $modal);
	});

	$overlay.click(function(e) {
		e.preventDefault();
		method.close();
	});

	return method;
}());
