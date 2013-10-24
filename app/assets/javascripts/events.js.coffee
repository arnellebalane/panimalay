$(document).ready ->
  events.initialize()

events =
  initialize: ->
    $("#new-event-hook").click events.showNewEventModal
    $("#calendar .day").click (e) ->
      $("#new-event-form #event_event_date").val($(this).data("date"))
      events.showNewEventModal(e)

    $("#new-event-overlay, #cancel-event-creation").click ->
      events.hideNewEventModal()

  showNewEventModal: (e) ->
    e.preventDefault()
    $("#new-event-modal").fadeIn(250)

  hideNewEventModal: ->
    $("#new-event-modal").fadeOut(250)
    $("#new-event-form input[type=text], #new-event-form textarea").val("")
    $("#new-event-form select option").prop("selected", false).first().prop("selected", true)