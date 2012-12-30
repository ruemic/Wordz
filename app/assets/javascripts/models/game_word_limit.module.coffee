Score      = require('models/score')

module.exports = Game = Backbone.Model.extend

  initialize: (options) ->
    @words = options.words
    @levelLength = @words.size()

    @answerCount = 0
    @.set(level: 1 )
    @.set(answer_count: 0 )
    @.set(mode: "play")

    window.score = new Score(words:@words)
    @score = window.score

    @listenTo(@score, 'change:score', @trackLevelProgress, @)
    @.on('change:mode', @nextLevel, @)


  trackLevelProgress: ->
    console.log "ans", @answerCount
    @answerCount += 1
    console.log "ans2", @answerCount
    @.set(answer_count: @answerCount )
    if @answerCount is @levelLength
      @.set(mode: "end")

  nextLevel: (options) ->
    if options.get('mode') is "nextLevel"
      @answerCount = 0 #TODO better progress tracking
      @score.endLevel()
      @getNextLevel()

  getNextLevel: ->
    nextLevel = @.get('level') + 1
    @.set(level: nextLevel )
    @words.fetchLevel(nextLevel)
