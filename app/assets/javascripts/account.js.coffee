$(document).ready ->
  info.initialize()
  settings.initialize()
  flashMessages.initialize()

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

settings =
  initialize: ->
    $("#profile-picture").on "click", "#change-profile-picture.unchanged", ->
      $("#user_profile_picture").click()

    $("#profile-picture").on "click", "#change-profile-picture.changed", ->
      settings.cancelFileLoad()

    $("#user_profile_picture").change ->
      settings.loadFile(this.files[0])

  loadFile: (file) ->
    reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = (data) ->
      $("#change-profile-picture").toggleClass("changed unchanged").text("Cancel")
      $("#profile-picture .profile-picture").append("<div style=\"background-image: url('#{data.target.result}')\"></div>")

  cancelFileLoad: ->
    $("#change-profile-picture").toggleClass("changed unchanged").text("Change")
    $("#profile-picture .profile-picture div").remove()
    $("#user_profile_picture").val("")

flashMessages =
  initialize: ->
    if $("p.notification").length > 0
      notification = $("p.notification").first()
      notification.css({"margin-left": -(notification.outerWidth() / 2) + "px"}).addClass("shown")
      setTimeout(->
        notification.removeClass("shown")
      , 2500)