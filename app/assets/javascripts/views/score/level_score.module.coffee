module.exports = LevelScoreView = Backbone.View.extend

  el: '#level-score'

  initialize: (options) ->
    @scoreModel = window.score
    @listenTo(@scoreModel, 'change:score', @render)
    @render()

  render: ->
    @$('span').html(@scoreModel.get('score'))


