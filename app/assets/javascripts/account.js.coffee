$(document).ready ->
  info.initialize()
  settings.initialize()

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
      $("#profile_picture").click()

    $("#profile-picture").on "click", "#change-profile-picture.changed", ->
      settings.cancelFileLoad()

    $("#profile_picture").change ->
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
    $("#profile_picture").val("")