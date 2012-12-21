module.exports = ScoreView = Backbone.View.extend

  el: '#score'

  initialize: (options) ->
    @scoreModel = window.score
    @listenTo(@scoreModel, 'change:score', @render)

  render: ->
    @$el.html(@scoreModel.get('score'))