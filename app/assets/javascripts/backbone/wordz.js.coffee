#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Wordz =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  init: ->
    @configureApp()
    window.router = new Wordz.Routers.GameRouter()
    Backbone.history.start()

  configureApp: ->
    @eventTracker = new Wordz.Models.EventTracker()

  get: (name) ->
    @[name]

$ ->
  Wordz.init()
