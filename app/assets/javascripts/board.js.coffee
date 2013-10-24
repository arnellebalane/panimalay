$(document).ready ->
  posts.initialize()
  comments.initialize()

posts = 
  initialize: ->
    posts.postTypeToggle()
    posts.contentFocus()

  postTypeToggle: ->
    posts.togglePostType()
    $("#new-post .actions a").click (e) ->
      e.preventDefault()
      $("#new-post .actions a.selected").removeClass("selected")
      $(this).addClass("selected")
      posts.togglePostType()

  togglePostType: ->
    selected = $("#new-post .actions a.selected").data("type")
    $("#new-post .post-fields[data-type='#{selected}']").show()
    $("#new-post .post-fields[data-type!='#{selected}']").hide()

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