Wordz.Views.Game ||= {}

class Wordz.Views.Game.Index extends Backbone.View

  id: "word-list"

  tagName: "ul"

  template: JST['backbone/templates/game/index']

  initialize: () ->
    @words = @options.words
    @words.bind('reset', @addAll)

  addAll: () ->
    @words.each(@addOne)
    @$('.question').first().addClass('current')


  addOne: (word) =>
    view = new Wordz.Views.Game.Word(model: word)
    @$el.append(view.render().el)

  render: =>
    @$el.html(@template())
    @addAll()
    @