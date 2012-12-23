LevelScoreView  =  require('views/score/level_score')
TotalScoreView  =  require('views/score/total_score')
ScoreModalView  =  require('views/score/score_modal')
IndexView       =  require('views/words/index')

module.exports = GameView = Backbone.View.extend

  el: "#level"

  template: JST['modal/points']

  initialize: (options) ->
    @words = options.collection
    @listenTo(@words, 'reset', @render)

    @totalScore = new TotalScoreView()
    @scoreModal = new ScoreModalView()
    @levelScore = new LevelScoreView()
    @indexView  = new IndexView(collection: @words).render()

  render: ->
    # TODO: Move into subview
    @$('span').html @words.page
