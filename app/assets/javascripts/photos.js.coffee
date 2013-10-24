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

  previewPhoto: (file) ->
    reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = (data) ->
      $("#photo-preview").css({"background-image": "url('#{data.target.result}')"})

  showPhotoPopup: (photo) ->
    ownerId = photo.data("owner")
    photoId = photo.data("id")
    # AJAX call to get user with id: ownerId
    # result supposedly stored to user
    user =
      name: "Arnelle Balane"
      profile_picture: "http://localhost:3000/photos/default.jpg"
    # AJAX call to get photo with id: photoId
    # result supposedly stored in photo
    photo =
      url: "http://localhost:3000/photos/default.jpg"
      caption: "Lorem ipsum Laboris laborum ullamco eu ut fugiat nisi ut ut sit eu ea id veniam enim anim veniam tempor Excepteur dolor irure enim."
      created_at: "October 25, 2013"

    $("#popup-modal #preview-section").css({"background-image": "url('#{photo.url}')"})
    $("#popup-modal #info-section .profile-picture").css({"background-image": "url('#{user.profile_picture}')"})
    $("#popup-modal #info-section a").text(user.name)
    $("#popup-modal #info-section p").text(photo.caption)
    $("#popup-modal #info-section time").text(photo.created_at)
    $("#popup-modal").fadeIn(250)

  hidePhotoPopup: ->
    $("#popup-modal").fadeOut(250)