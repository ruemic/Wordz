#= require jquery
#= require jquery_ujs
#= require jquery.sortable
#= require underscore
#= require backbone
#= require backbone.offline
#= require backbone.position
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./views
#= require_self

Words      = require('models/word')
IndexView  = require('views/words/index')
Score      = require('models/score')
ScoreView  = require('views/score/score')

$ ->
  words = new Words()
  words.fetch
    success: (collection) ->
      window.score = new Score(words:collection)


  new IndexView(collection: words).render()
  new ScoreView().render()
