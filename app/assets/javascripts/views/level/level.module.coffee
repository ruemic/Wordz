module.exports = LevelView = Backbone.View.extend

  el: "#level"

  initialize: (options) ->
    @$container = $(".container")

    @words = options.collection
    @listenTo(@words, 'reset', @render)
    @listenTo(window.game, 'change:level', @styleLevel)
    @listenTo(window.game, 'change:answer_count', @indicateProgress)

    @render()
    @styleLevel()

    @

  render: ->
    @$('span').html @words.page

  indicateProgress: ->
    progress = window.game.answerCount
    @$container.css
      background: @progressValue(progress ? 0)

  styleLevel: ->
    @levelHue = Math.floor(Math.random() *360) + 1
    @indicateProgress()

  progressValue: (progress) ->
    hue = @levelHue
    saturation = progress * 8
    value = ( progress * 4 ) + 50
    return "hsl(" + hue + "," + saturation + "%," + value + "%)"


