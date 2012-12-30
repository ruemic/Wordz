module.exports = Timer = Backbone.View.extend

  el: "#timer"

  initialize: ->
    _.bindAll(@, 'tick')
    @totalSeconds = undefined
    @createTimer(4)

  createTimer: (time) ->
    @totalSeconds = time
    @updateTimer()
    setTimeout( @tick, 1000 )

  tick: ->
    @totalSeconds -= 1
    @updateTimer()
    if @totalSeconds is 0
      console.log "stop game"
    else
      setTimeout( @tick, 1000 )

  updateTimer: ->
    @$el.html( @totalSeconds )

