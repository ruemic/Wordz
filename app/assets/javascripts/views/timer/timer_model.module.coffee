module.exports = Timer = Backbone.Model.extend

  initialize: ->

    _.bindAll(@, 'tick')
    @.set(seconds: 0 )
    @.on("change:mode", @tick, @ )


  tick: ->
    unless @.get('mode') is "pause"
      second = @.get('seconds')
      second = second += 1
      @.set(seconds: second )
      setTimeout( @tick, 1000 )

  reset: ->
    @.set(seconds: 0)

  pause: ->
    @.set(mode: 'pause' )

  play: ->
    @.set(mode: 'play' )

