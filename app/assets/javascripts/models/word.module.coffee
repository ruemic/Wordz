Word = Backbone.Model.extend
  validate: (attrs) ->
    correct = $.trim(attrs.correct)
    return "Can't be blank" if _.isEmpty(correct)

  correctWord: ->
    @.get('correct')

  incorrectWord: ->
    @.get('incorrect')


  checkSpelling: (word) ->
    if word is @.correctWord()
      @handleSuccess()
    else
      @handleFailure()
    return

  handleSuccess: ->
    @.set("answer":"correct")
    successSound = new buzz.sound "/assets/success",
      formats: ["mp3"]
    successSound.play().loop()

  handleFailure: ->
    @.set("answer":"incorrect")



module.exports = Words = Backbone.Collection.extend
  model: Word
  url: 'api/words'

  initialize: ->
    @storage = new Offline.Storage('words', @, autoPush: true)
