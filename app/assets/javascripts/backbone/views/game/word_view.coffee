Wordz.Views.Game ||= {}

class Wordz.Views.Game.Word extends Backbone.View

  template: JST['backbone/templates/game/word']

  className: 'question'

  tagName: 'li'

  events:
    'click .word' : 'checkAnswer'

  initialize: ->
    _.bindAll(@, 'markAsIncorrect', 'nextQuestion')

  render: ->
    oneOrZero = Math.round(1 * Math.random())
    if oneOrZero is 0
      @$el.html( @template(correct: @model.get('correct'), incorrect: @model.get('incorrect') ))
    else
      @$el.html( @template(incorrect: @model.get('correct'), correct: @model.get('incorrect') ))
    @

  checkAnswer: (event) ->
    $word = $(event.currentTarget)
    spelling = $word.text()
    if @model.isCorrect(spelling) is true
      @markAsCorrect($word)
    else
      @markAsIncorrect($word)

  markAsCorrect: ($word) ->
    # TODO fix grabbing both words when incorrect word contains correct word
    $word.addClass('correct')
    @$el.removeClass('current').addClass('answered-correct')
    @nextQuestion()

  markAsIncorrect: ($word) ->
    $word.addClass('incorrect')
    @$el.removeClass('current').addClass('answered-incorrect')
    setTimeout( @nextQuestion, 1000 )

  nextQuestion: ->
    @$el.next('li').addClass('current')
