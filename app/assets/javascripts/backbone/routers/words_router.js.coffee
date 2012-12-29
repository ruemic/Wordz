class Wordz.Routers.WordsRouter extends Backbone.Router
  initialize: (options) ->
    @words = new Wordz.Collections.WordsCollection()
    @words.reset options.words

  routes:
    "new"      : "newWord"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newWord: ->
    @view = new Wordz.Views.Words.NewView(collection: @words)
    $("#words").html(@view.render().el)

  index: ->
    @view = new Wordz.Views.Words.IndexView(words: @words)
    $("#words").html(@view.render().el)

  show: (id) ->
    word = @words.get(id)

    @view = new Wordz.Views.Words.ShowView(model: word)
    $("#words").html(@view.render().el)

  edit: (id) ->
    word = @words.get(id)

    @view = new Wordz.Views.Words.EditView(model: word)
    $("#words").html(@view.render().el)
