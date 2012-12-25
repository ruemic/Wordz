#= require jquery
#= require modernizr
#= require jquery_ujs
#= require jquery.sortable
#= require underscore
#= require backbone
#= require backbone.offline
#= require reveal
#= require webAudioApiForDesigners
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_self

Game       = require('models/game')
Words      = require('collections/words')
GameView   = require('views/game')

$ ->

  words = new Words(page: 1)
  words.fetch
    success: (collection) ->
      window.game = new Game(words:collection)

  new GameView(collection: words).render()
