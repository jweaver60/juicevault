# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).bind("load", ->
  footer = $(".sitefooter")
  pos = footer.position()
  height = $(window).height()
  height = height - pos.top
  height = height - footer.height()
  if height > 0
    footer.css({ 'margin-top': height + 'px' })
)