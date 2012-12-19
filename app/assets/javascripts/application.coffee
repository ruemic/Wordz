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

Dreams    = require('models/dream')
IndexView = require('views/dreams/index')

Words     = require('models/word')
IndexView = require('views/words/index')

$ ->
  words = new Words()
  words.fetch()
  window.words = words

  new IndexView(collection: words).render()
