module.exports = Score = Backbone.Model.extend

  initialize: (options) ->
    @.set(score: 0)
    @points = @.get('score')
    @words = options.words
    @listenTo(@words, 'change:answer', @updateScore)

  updateScore: (word) ->
    if word.get('answer') is "correct"
      @changePoints(+3)
    else
      @changePoints(-1)

  changePoints: (number) ->
    @points += number
    @.set(score: @points)
