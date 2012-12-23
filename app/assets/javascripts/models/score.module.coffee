module.exports = Score = Backbone.Model.extend

  initialize: (options) ->
    @.set(score: 0)
    @points = @.get('score')
    @words = options.words
    @listenTo(@words, 'change:answer', @evaluateAnswer)

  evaluateAnswer: (word) ->
    if word.get('answer') is "correct"
      @changePoints(+3)
      @playSuccessSound()
    else
      @changePoints(-1)

  changePoints: (number) ->
    @points += number
    @.set(score: @points)

  playSuccessSound: ->
    successSound = new buzz.sound "/assets/success",
      formats: ["mp3", "ogg"]
    successSound.play()