

TimerView       =  require('views/timer/timer_view')

LevelScoreView  =  require('views/score/level_score')
TotalScoreView  =  require('views/score/total_score')
ScoreModalView  =  require('views/score/score_modal')
LevelView       =  require('views/level/level')
IndexView       =  require('views/questions/index')

module.exports = GameView = Backbone.View.extend



  initialize: (options) ->
    @timer = new TimerView()

    @words = options.collection
    @levelView  = new LevelView(collection: @words)

    @totalScore = new TotalScoreView()
    @scoreModal = new ScoreModalView()
    @levelScore = new LevelScoreView()

    @indexView  = new IndexView(collection: @words).render()

