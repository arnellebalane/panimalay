$(document).ready ->
  info.initialize()

info =
  initialize: ->
    info.currentTab()
    $("#user-bio nav a").click (e) ->
      e.preventDefault()
      $("#user-bio nav a.current").removeClass("current")
      $("#user-bio section").hide()
      $(this).addClass("current")
      info.currentTab()

  currentTab: ->
    current = $("#user-bio nav a.current").data("tab")
    $("#user-bio section[data-tab='#{current}']").show()