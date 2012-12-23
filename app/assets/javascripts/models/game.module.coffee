Score      = require('models/score')

module.exports = Game = Backbone.Model.extend

  initialize: (options) ->
    @words = options.words
    @levelLength = @words.size()

    @answerCount = 0
    @.set(level:1)
    @.set(mode: "play")

    window.score = new Score(words:@words)
    @score = window.score

    @listenTo(@score, 'change:score', @trackLevelProgress, @)
    @.on('change:mode', @nextLevel, @)


  trackLevelProgress: ->
    @answerCount += 1
    console.log "answer Count: ", @answerCount
    if @answerCount is @levelLength
      @.set(mode: "end")


  nextLevel: (options) ->
    if options.get('mode') is "nextLevel"
      @score.endLevel()
      @getNextLevel()

  getNextLevel: ->
    nextLevel = @.get('level') + 1
    @.set(level: nextLevel )
    @words.fetchLevel(nextLevel)
    @answerCount = 0 #TODO better progress tracking
