Wordz.Views.Game ||= {}

class Wordz.Views.Game.Start extends Backbone.View

  id: "start-screen"

  template: JST['backbone/templates/game/start']

  render: ->
    @$el.html(@template())
    @