module.exports = Timer = Backbone.View.extend

  el: "#timer"

  events:
    "click" : "pause"

  initialize: ->
    @model = window.timer
    @listenTo(@model, "change:seconds", @render)

  render: ->
    time = @model.get('seconds')
    @$('div').html( time )

  pause: ->
    if @model.get('mode') is "pause"
      @model.play()
    else
      @model.pause()
