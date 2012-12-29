Wordz.Views.Game ||= {}

class Wordz.Views.Game.Index extends Backbone.View

  id: "index"

  template: JST['backbone/templates/game/index']

  initialize: () ->
    @words = @options.words
    @words.bind('reset', @addAll)

  addAll: () ->
    @words.each(@addOne)

  addOne: (word) =>
    view = new Wordz.Views.Game.Word(model: word)
    @$el.append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    @