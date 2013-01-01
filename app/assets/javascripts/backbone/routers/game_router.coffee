class Wordz.Routers.GameRouter extends Backbone.Router

  initialize: ->
    @words = new Wordz.Collections.WordsCollection()
    @game = new Wordz.Models.GameMaster()

  routes:
    "/*"    : "start"
    "play"   : "play"

  start: ->
    window.view = new Wordz.Views.Game.Start()
    $("#game").html(window.view.render().el)

  play: ->
    @words.fetch
      success: (collection) ->
        @view = new Wordz.Views.Game.Index(words: collection)
        $("#game").html(@view.render().el)

