module.exports = QuestionView = Backbone.View.extend
  template: JST['questions/question']

  tagName: 'li'
  className: 'question'

  events:
    "click .word" : "checkAnswer"

  initialize: (options) ->
    @listenTo(@model, 'change:answered_incorrectly', @markAsIncorrect)
    @listenTo(@model, 'change:answered_correctly', @markAsCorrect)

  render: ->
    oneOrZero = Math.round(1 * Math.random())
    if oneOrZero is 0
      @$el.html @template(wordA: @model.get('correct'),   wordB: @model.get('incorrect'))
    else
      @$el.html @template(wordA: @model.get('incorrect'), wordB: @model.get('correct')  )
    @

  checkAnswer: (event) ->
    word = $(event.currentTarget).text()
    @model.checkSpelling(word)

  markAsCorrect: ->
    # TODO fix grabbing both words when incorrect word contains correct word
    # TODO fix multiple triggerings
    $correctWord = @$el.find( "p:contains(#{@model.correctWord()})" )
    $correctWord.addClass('correct')
    @nextQuestion()

  markAsIncorrect: ->
    $incorrectWord = @$el.find( "p:contains(#{@model.incorrectWord()})" )
    $incorrectWord.addClass('incorrect')
    @nextQuestion()

  nextQuestion: ->
    @$el.removeClass('current').addClass('answered')
    @$el.next('li').addClass('current')
