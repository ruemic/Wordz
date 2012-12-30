module.exports = QuestionView = Backbone.View.extend
  template: JST['questions/question']

  tagName: 'li'
  className: 'question'

  events:
    "click .word" : "checkAnswer"

  initialize: (options) ->
    _.bindAll(@, 'markAsIncorrect', 'nextQuestion')

  render: ->
    oneOrZero = Math.round(1 * Math.random())
    if oneOrZero is 0
      @$el.html @template(wordA: @model.get('correct'),   wordB: @model.get('incorrect'))
    else
      @$el.html @template(wordA: @model.get('incorrect'), wordB: @model.get('correct')  )
    @

  checkAnswer: (event) ->
    word = $(event.currentTarget).text()
    if @model.isCorrect(word) is true
      @markAsCorrect()
    else
      @markAsIncorrect()

  markAsCorrect: ->
    # TODO fix grabbing both words when incorrect word contains correct word
    $correctWord = @$el.find( "p:contains(#{@model.correctWord()})" )
    $correctWord.addClass('correct')
    @nextQuestion()

  markAsIncorrect: ->
    $incorrectWord = @$el.find( "p:contains(#{@model.incorrectWord()})" )
    $incorrectWord.addClass('incorrect')
    setTimeout( @nextQuestion, 300 )

  nextQuestion: ->
    @$el.removeClass('current').addClass('answered')
    @$el.next('li').addClass('current')
