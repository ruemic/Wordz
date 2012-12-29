class MissPellings.Routers.GameRouter extends Backbone.Router

  initialize: (options) ->
    @words = new MissPellings.Collections.WordsCollection()
    @words.reset options.words

  routes:
    ".*"    : "index"

  index: ->
    @view = new MissPellings.Views.Game.Index(words: @words)
    $("#game").html(@view.render().el)

