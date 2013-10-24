$(document).ready ->
  posts.initialize()
  comments.initialize()

posts = 
  initialize: ->
    $("#new-post .post-fields[data-type='post']").show()
    posts.contentFocus()

    $("#new-post .actions a[data-type='photo']").click (e) ->
      e.preventDefault()
      posts.attachPhoto()

    $("#new-post .actions a[data-type='post']").click (e) ->
      e.preventDefault()
      posts.detachPhoto()

  attachPhoto: ->
    $("#new-post .actions a[data-type='post']").removeClass("selected")
    $("#new-post .actions a[data-type='photo']").addClass("selected")
    $("#new-post .post-fields[data-type='photo']").show()
    $("#new-post .post-fields[data-type='post'] textarea").attr("placeholder", "Photo caption")

  detachPhoto: ->
    $("#new-post .actions a[data-type='photo']").removeClass("selected")
    $("#new-post .actions a[data-type='post']").addClass("selected")
    $("#new-post .post-fields[data-type='photo']").hide()
    $("#new-post .post-fields[data-type='post'] textarea").attr("placeholder", "Write something...")
    $("#new-post .post-fields[data-type='photo'] input[type='file']").val("")

  contentFocus: ->
    $("#new-post textarea, #new-post input[type=text], #new-post select").focus ->
      $("#new-post").addClass("focused")
    $("#new-post textarea, #new-post input[type=text], #new-post select").blur ->
      $("#new-post").removeClass("focused")

comments =
  initialize: ->
    $(".comment-hook").click (e) ->
      e.preventDefault()
      $(this).toggleClass("shown")
      comments = $(this).closest("footer").siblings(".comments").toggle()
      if comments.find(".comment").length == 0
        comments.find(".new-comment textarea").focus()