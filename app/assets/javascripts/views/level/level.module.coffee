module.exports = LevelView = Backbone.View.extend

  el: "#level"

  initialize: (options) ->
    @words = options.collection
    @listenTo(@words, 'reset', @render)
    @render()
    @

  render: ->
    @$('span').html @words.page