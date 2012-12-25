ScoreSound = require('views/score/score_sound')
module.exports = Score = Backbone.Model.extend

  initialize: (options) ->
    @.set(total_score: 0)
    @.set(score: 0)
    @points = @.get('score')
    @words = options.words
    @sound = new ScoreSound()

    @listenTo(@words, 'change:answer', @evaluateAnswer)

  evaluateAnswer: (word) ->
    if word.get('answer') is "correct"
      @changePoints(+3)
      @sound.success()
    else
      @changePoints(-1)

  changePoints: (number) ->
    @points += number
    @.set(score: @points)

  endLevel: ->
    totalScore = @.get('total_score') + @points
    @.set(total_score: totalScore)
    @.set(score: 0)
    @points = 0

