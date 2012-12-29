class Wordz.Routers.GameRouter extends Backbone.Router

  initialize: (options) ->
    @words = new Wordz.Collections.WordsCollection()
    @words.reset options.words

  routes:
    ".*"    : "index"

  index: ->
    @view = new Wordz.Views.Game.Index(words: @words)
    $("#game").html(@view.render().el)

