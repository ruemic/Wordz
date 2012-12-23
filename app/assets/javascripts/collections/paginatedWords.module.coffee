module.exports = PaginatedWords = Backbone.Paginator.requestPager.extend
  model: Word
  url: 'api/words'

  initialize: ->
    @storage = new Offline.Storage('words', @, autoPush: true)

