Wordz.Views.Game ||= {}

class Wordz.Views.Game.Word extends Backbone.View

  template: JST["backbone/templates/game/word"]

  className: 'word'

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @