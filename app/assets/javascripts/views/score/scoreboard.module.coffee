LevelScoreView  =  require('views/score/level_score')
TotalScoreView  =  require('views/score/total_score')
ScoreModalView  =  require('views/score/score_modal')

module.exports = ScoreboardView = Backbone.View.extend

  template: JST["score/scoreboard"]
  id: "scoreboard"
  tagName: 'ul'

  initialize: ->
    @scoreModel = window.score
    @listenTo(@scoreModel, 'change:total_score', @render)
    @listenTo(@scoreModel, 'change:score', @render)
    @levelScore = new LevelScoreView()
    @totalScore = new TotalScoreView()
    @scoreModal = new ScoreModalView()

  render: ->
    @$el.html @template()
    @$el.prepend @levelScore.render(@scoreModel.get('score')).el
