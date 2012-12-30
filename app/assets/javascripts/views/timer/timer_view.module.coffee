module.exports = Timer = Backbone.View.extend

  el: "#timer"

  events:
    "click" : "pause"

  initialize: (options) ->
    @model = window.timer
    @listenTo(@model, "change:seconds", @render)
    @model.set(mode:"play")

  render: ->
    time = @model.get('seconds')
    @$('div').html( time )

  pause: ->
    if @model.get('mode') is "pause"
      @model.play()
    else
      @model.pause()

