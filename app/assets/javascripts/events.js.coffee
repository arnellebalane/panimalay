$(document).ready ->
  events.initialize()

events =
  initialize: ->
    $("#new-event-hook").click events.showNewEventModal
    $("#calendar .day").not(".unselectable").click (e) ->
      $("#new-event-form #event_event_date").val($(this).data("date"))
      events.showNewEventModal(e)

    $("#new-event-overlay, #cancel-event-creation").click ->
      events.hideNewEventModal()

    events.bubble()

  showNewEventModal: (e) ->
    e.preventDefault()
    $("#new-event-modal").fadeIn(250)

  hideNewEventModal: ->
    $("#new-event-modal").fadeOut(250)
    $("#new-event-form input[type=text], #new-event-form textarea").val("")
    $("#new-event-form select option").prop("selected", false).first().prop("selected", true)

  bubble: ->
    $(".day > div").mouseover ->
      events.positionBubble($(this))

  positionBubble: (element) ->
    outer = element.find(".events-bubble")
    inner = outer.find(".events-list")
    if outer.outerHeight() > inner.outerHeight()
      outer.outerHeight(inner.outerHeight() + 3)
    top = -(outer.outerHeight() / 2 - 7)
    if element.offset().top + top < $(document).scrollTop()
      top = $(document).scrollTop() - element.offset().top + 10
    if element.offset().top + top + outer.outerHeight() - $(window).scrollTop() > $(window).innerHeight() - 45
      top += ($(window).innerHeight() - 45) - (element.offset().top + top + outer.outerHeight() - $(window).scrollTop())
    outer.css({"top": top + "px"})
    outer.show()