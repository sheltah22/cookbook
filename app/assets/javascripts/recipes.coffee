# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('form').on 'click', '.remove_ingredient', (event) ->
    $(this).closest('.level-item').prev('input[type=hidden]').val(1)
    $(this).closest('fieldset').hide()
    event.preventDefault()

  $('form').on 'click', '.add_ingredient', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this.closest('.level')).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()
