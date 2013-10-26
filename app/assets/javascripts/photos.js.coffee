BASE_URL = "http://localhost:3000/"

$(document).ready ->
  photos.initialize()

photos =
  initialize: ->
    $("#photo-preview").click (e) ->
      $("#photo-container input[type='file']").click()

    $("#photo-container input[type='file']").change ->
      photos.previewPhoto(this.files[0])

    $(".photo-gallery .photo").click ->
      photos.showPhotoPopup($(this))

    $("#popup-overlay, #popup .close").click photos.hidePhotoPopup
    $(document).keydown (e) ->
      if e.keyCode == 27
        photos.hidePhotoPopup()

  previewPhoto: (file) ->
    reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = (data) ->
      $("#photo-preview").css({"background-image": "url('#{data.target.result}')"})

  showPhotoPopup: (photo) ->
    ownerId = photo.data("owner")
    photoId = photo.data("id")

    $.ajax
      url: BASE_URL + "photos/get_photo"
      type: "POST"
      data: {id: photoId}
      success: (photo) ->
        $("#popup-modal #preview-section").css({"background-image": "url('#{photo.url}')"})
        $("#popup-modal #info-section p").text(photo.caption)
        $("#popup-modal #info-section time").text(photo.created_at)

    $.ajax
      url: BASE_URL + "photos/get_user"
      type: "POST"
      data: {id: ownerId}
      success: (user) ->  
        $("#popup-modal #info-section .profile-picture").css({"background-image": "url('#{user.profile_picture}')"})
        $("#popup-modal #info-section a").text(user.name)

    $("#popup-modal").fadeIn(250)

  hidePhotoPopup: ->
    $("#popup-modal").fadeOut(250)