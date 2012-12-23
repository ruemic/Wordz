module.exports = ScoreModalView = Backbone.View.extend

  el: ".level-modal"

  template: JST['modal/points']

  initialize: ->
    @game = window.game
    @game.on('change:mode', @render, @)

  render: (options) ->
    if options.get('mode') is "end"
      levelScore = score.get('score')
      @$el.html(@template(points: levelScore))
      @$el.reveal
        closed: ->
          game.set('mode':'nextLevel')





