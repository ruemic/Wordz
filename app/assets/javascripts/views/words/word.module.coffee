module.exports = WordView = Backbone.View.extend
  template: JST['words/word']
  tagName: 'li'
  className: "question"

  events:
    "click .word" : "checkAnswer"

  initialize: (options) ->
    @listenTo(@model, 'change:answer', @updateState)

  render: ->
    if @randomInteger(1) is 0
      @$el.html @template(wordA: @model.get('correct'),   wordB: @model.get('incorrect'))
    else
      @$el.html @template(wordA: @model.get('incorrect'), wordB: @model.get('correct')  )
    @

  randomInteger: (lower, upper=0) ->
    start = Math.random()
    if not lower?
      [lower, upper] = [0, lower]
    if lower > upper
      [lower, upper] = [upper, lower]
    return Math.floor(start * (upper - lower + 1) + lower)

  checkAnswer: (e) ->
    if @model.get('answer') is undefined
      word = $(e.currentTarget).text()
      @model.checkSpelling(word)



  updateState: ->
    if @model.get('answer') is "correct"
      @markAsCorrect()
    else
      @markAsIncorrect()
    @nextQuestion()

  markAsCorrect: ->
    $correctWord = @$el.find( "p:contains(#{@model.correctWord()})" )
    $correctWord.addClass('correct')

  markAsIncorrect: ->
    $incorrectWord = @$el.find( "p:contains(#{@model.incorrectWord()})" )
    $incorrectWord.addClass('incorrect')

  nextQuestion: ->
    @$el.slideUp(300)