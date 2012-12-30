module.exports = Timer = Backbone.Model.extend

  initialize: ->

    _.bindAll(@, 'tick')
    @.set(time: 0 )
    @.on("change:mode", @tick, @ )

  tick: ->
    unless @.get('mode') is "pause"
      time = @.get('time')
      time = time += 1

      minutes = Math.floor(time / 60)
      seconds = time % 60
      @.set(minutes: minutes )
      @.set(seconds: seconds )
      @.set(time: time)

      setTimeout( @tick, 1000 )

  reset: ->
    @.set(time: 0)

  pause: ->
    @.set(mode: 'pause' )

  play: ->
    @.set(mode: 'play' )

