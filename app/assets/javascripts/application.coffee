#= require jquery
#= require modernizr
#= require jquery_ujs
#= require underscore
#= require backbone
#= require backbone.offline
#= require reveal
#= require mousetrap
#= require webAudioApiForDesigners
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./routers
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_self


WordsRouter = require('routers/router')

$ ->
  window.router = new WordsRouter()
  Backbone.history.start()


