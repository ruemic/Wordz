LevelScoreView  =  require('views/score/level_score')
TotalScoreView  =  require('views/score/total_score')
ScoreModalView  =  require('views/score/score_modal')
LevelView       =  require('views/level/level')
IndexView       =  require('views/words/index')

module.exports = GameView = Backbone.View.extend

  initialize: (options) ->
    @words = options.collection

    @totalScore = new TotalScoreView()
    @scoreModal = new ScoreModalView()
    @levelScore = new LevelScoreView()
    @levelView  = new LevelView(collection: @words)

    @indexView  = new IndexView(collection: @words).render()

