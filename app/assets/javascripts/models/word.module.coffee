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

  handleFailure: ->
    @.set("answer":"incorrect")



module.exports = Words = Backbone.Collection.extend

  initialize: (options) ->
    @storage = new Offline.Storage('words', @, autoPush: true)
    @page = if options.page then options.page else 1
    @

  model: Word

  url: ->
    "/api/words/?page=" + @page



