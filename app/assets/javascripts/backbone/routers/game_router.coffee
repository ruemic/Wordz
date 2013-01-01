class Wordz.Routers.GameRouter extends Backbone.Router

  initialize: ->
    @words = new Wordz.Collections.WordsCollection()

  routes:
    ".*"    : "index"

  index: ->
    @words.fetch
      success: (collection) ->
        @view = new Wordz.Views.Game.Index(words: collection)
        $("#game").html(@view.render().el)

