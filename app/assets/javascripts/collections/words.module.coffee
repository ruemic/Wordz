Word = require('models/word')

module.exports = Words = Backbone.Collection.extend

  initialize: (options) ->
    @storage = new Offline.Storage('words', @, autoPush: true)
    @page = if options.page then options.page else 1
    @

  model: Word

  url: ->
    "/api/words/?page=" + @page

  fetchLevel: (level) ->
    @page = level
    @.fetch()
