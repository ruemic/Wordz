Wordz.Views.Game ||= {}

class Wordz.Views.Game.Word extends Backbone.View

  template: JST["backbone/templates/game/word"]

  className: 'word'

  events:
    'click' : 'flip'

  flip: ->
    @$('p').toggleClass('visible')
    console.log "flip"

  render: ->
    @$el.html(@template(@model.toJSON() ))
    @