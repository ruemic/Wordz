Word = Backbone.Model.extend
  validate: (attrs) ->
    correct = $.trim(attrs.correct)
    return "Can't be blank" if _.isEmpty(correct)

  checkSpelling: (word) ->
    if word is @.correctWord()
      @.set("answer":"correct")
    else
      @.set("answer":"incorrect")
    return

  correctWord: ->
    @.get('correct')

  incorrectWord: ->
    @.get('incorrect')


module.exports = Words = Backbone.Collection.extend
  model: Word
  url: 'api/words'

  initialize: ->
    @storage = new Offline.Storage('words', @, autoPush: true)
