$(document).ready ->
  textareas.initialize()
  flashMessages.initialize()

flashMessages =
  initialize: ->
    if $("p.notification").length > 0
      notification = $("p.notification").first()
      notification.css({"margin-left": -(notification.outerWidth() / 2) + "px"}).addClass("shown")
      setTimeout(->
        notification.removeClass("shown")
      , 2500)

textareas =
  initialize: ->
    $("textarea.autosize").autosize()