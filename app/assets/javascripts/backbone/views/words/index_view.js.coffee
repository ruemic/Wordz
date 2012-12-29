Wordz.Views.Words ||= {}

class Wordz.Views.Words.IndexView extends Backbone.View
  template: JST["backbone/templates/words/index"]

  initialize: () ->
    @words = @options.words
    @words.bind('reset', @addAll)


  addAll: () =>
    @options.words.each(@addOne)

  addOne: (word) =>
    view = new Wordz.Views.Words.WordView({model : word})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(words: @options.words.toJSON() ))
    @addAll()

    return this
