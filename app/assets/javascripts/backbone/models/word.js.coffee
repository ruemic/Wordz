class Wordz.Models.Word extends Backbone.Model
  paramRoot: 'word'

  defaults:
    word: null
    correct: null

  validate: (attrs) ->
    correct = $.trim(attrs.correct)
    return "Can't be blank" if _.isEmpty(correct)

  correctWord: ->
    @.get('correct')

  incorrectWord: ->
    @.get('incorrect')

  judgeCorrectnessOf: (spelling) ->
    if spelling is @.correctWord()
      @.set(answer: true)
      return true
    else
      @.set(answer: false)
      return false
    return











class Wordz.Collections.WordsCollection extends Backbone.Collection
  model: Wordz.Models.Word
  url: '/game'

