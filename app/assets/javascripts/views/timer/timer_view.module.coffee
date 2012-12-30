module.exports = Timer = Backbone.View.extend

  el: "#timer"

  events:
    "click" : "pause"

  initialize: (options) ->
    @model = window.timer
    @listenTo(@model, "change:seconds", @renderSeconds)
    @listenTo(@model, "change:minutes", @renderMinutes)
    @model.set(mode:"play")

  renderSeconds: ->
    seconds = @model.get('seconds')
    if seconds < 10
      seconds = "0" + seconds
    @$('.seconds').html( seconds )

  renderMinutes: ->
    minutes = @model.get('minutes')
    if minutes > 0
      @$('.minutes').html( minutes )

  pause: ->
    if @model.get('mode') is "pause"
      @model.play()
    else
      @model.pause()

