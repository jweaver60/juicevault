$ ->
	forms = $('form.rating_ballot, form.rating_display')
	for form in forms
		checkedId = $('form#' + form.id + ' > input:checked').attr('id')
		$('form#' + form.id + ' > label[for=' + checkedId + ']').prevAll().andSelf().addClass('bright')

$(document).ready ->
	
	$('form.rating_ballot > label').hover ->
    $(@).prevAll().andSelf().addClass('glow')
  , ->
    $(@).prevAll().andSelf().removeClass('glow')

  $('form.rating_ballot > label').click ->
  	$(@).siblings().removeClass('bright')
  	$(@).prevAll().andSelf().addClass('bright')

	$('form.rating_ballot').change ->
		$('form.rating_ballot').submit()