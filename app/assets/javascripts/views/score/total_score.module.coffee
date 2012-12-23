module.exports = TotalScoreView = Backbone.View.extend

  el: '#total-score'

  initialize: (options) ->
    @scoreModel = window.score
    @listenTo(@scoreModel, 'change:total_score', @render)
    @render()

  render: ->
    @$('span').html(@scoreModel.get('total_score'))


