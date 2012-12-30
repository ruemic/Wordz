module.exports = Word = Backbone.Model.extend
  validate: (attrs) ->
    correct = $.trim(attrs.correct)
    return "Can't be blank" if _.isEmpty(correct)

  correctWord: ->
    @.get('correct')

  incorrectWord: ->
    @.get('incorrect')


  isCorrect: (word) ->
    if word is @.correctWord()
      @handleSuccess(@)
      return true
    else
      @handleFailure(@)
      return false
    return

  handleFailure: (model) ->
    model.set(answered_incorrectly: true)

  handleSuccess: (model) ->
    model.set(answered_correctly: true)


