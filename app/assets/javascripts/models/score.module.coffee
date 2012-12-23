module.exports = Score = Backbone.Model.extend

  initialize: (options) ->
    @.set(total_score: 0)
    @.set(score: 0)
    @points = @.get('score')
    @words = options.words

    @listenTo(@words, 'change:answer', @evaluateAnswer)

    @successSound = new Audio()
    if Modernizr.audio.mp3 == ""
      @successSound.src = '/assets/success.ogg'
    else
      @successSound.src = '/assets/success.mp3'

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
    audio = @successSound.cloneNode().play()

  endLevel: ->
    totalScore = @.get('total_score') + @points
    @.set(total_score: totalScore)
    @.set(score: 0)
    @points = 0

