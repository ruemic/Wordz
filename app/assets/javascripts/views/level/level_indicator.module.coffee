module.exports = LevelIndicatorView = Backbone.View.extend

  el: "#level"

  initialize: ->
    @collection.on 'reset', @render, @
    @render()
    @

  render: ->
    @$('span').html @collection.page

