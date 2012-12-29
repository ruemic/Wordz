MissPellings.Views.Game ||= {}

class MissPellings.Views.Game.Index extends Backbone.View

  id: "index"

  template: JST['backbone/templates/game/index']

  initialize: () ->
    @words = @options.words
    @words.bind('reset', @addAll)

  addAll: () ->
    @words.each(@addOne)

  addOne: (word) =>
    view = new MissPellings.Views.Game.Word(model: word)
    @$el.append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    @