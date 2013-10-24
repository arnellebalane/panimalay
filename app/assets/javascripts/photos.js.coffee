$(document).ready ->
  photos.initialize()

photos =
  initialize: ->
    $("#photo-preview").click (e) ->
      $("#photo-container input[type='file']").click()

    $("#photo-container input[type='file']").change ->
      photos.previewPhoto(this.files[0])

  previewPhoto: (file) ->
    reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = (data) ->
      $("#photo-preview").css({"background-image": "url('#{data.target.result}')"})