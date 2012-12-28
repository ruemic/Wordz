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
      @revealModal()

  revealModal: ->
    @$el.reveal
      open: ->
        Mousetrap.bind "enter", ->
          $('.reveal-modal-bg').click()
          console.log "space bound"
      closed: ->
        game.set('mode':'nextLevel')
        Mousetrap.unbind "enter"




