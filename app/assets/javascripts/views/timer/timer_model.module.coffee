module.exports = Timer = Backbone.Model.extend

  initialize: ->

    _.bindAll(@, 'tick')
    @.on("change:mode", @tick, @ )
    @.set( seconds: 0 )


  tick: ->
    unless @.get('mode') is "pause"
      second = @.get('seconds')
      second = second += 1
      @.set( seconds: second )
      setTimeout( @tick, 1000 )

  pause: ->
    @.set (mode: 'pause' )

  play: ->
    @.set( mode: 'play' )

