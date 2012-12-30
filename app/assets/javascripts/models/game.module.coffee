Score      = require('models/score')
Timer      = require('views/timer/timer_model')


module.exports = Game = Backbone.Model.extend

  initialize: (options) ->
    window.timer = new Timer()

    @words = options.words
    @levelLength = @words.size()

    @answerCount = 0
    @.set(level: 1 )
    @.set(answer_count: 0 )
    @.set(mode: "play")


    window.score = new Score(words:@words)
    @score = window.score

    @words.on('reset', @startLevel, @)
    @listenTo(@score, 'change:score', @trackLevelProgress, @)
    @.on('change:mode', @nextLevel, @)


  startLevel: ->
    console.log "start"
    @answerCount = 0
    window.timer.play()


  trackLevelProgress: ->
    @answerCount += 1
    @.set( answer_count: @answerCount )
    if @answerCount is @levelLength
      @endLevel()

  endLevel: ->
    @.set( mode: "end" )

  nextLevel: (options) ->
    if options.get('mode') is "nextLevel"
      @score.endLevel()
      @getNextLevel()

  getNextLevel: ->
    nextLevel = @.get('level') + 1
    @.set( level: nextLevel )
    @words.fetchLevel(nextLevel)
