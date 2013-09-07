$(document).ready ->
  sessions.initialize()

sessions =
  initialize: ->
    $("#main-header #sign-in a").click (e) ->
      e.preventDefault()
      $(this).toggleClass("highlighted")
      sessions.toggleForm()

  toggleForm: ->
    if $("form#user-session:visible").length == 0
      sessions.showForm()
    else
      sessions.hideForm()

  showForm: ->
    $("form#user-session").slideDown(100).find("input[type='email']").focus()

  hideForm: ->
    $("form#user-session").slideUp(100).find("input[type='email'], input[type='password']").val("")