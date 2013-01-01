Wordz.Views.Game ||= {}

class Wordz.Views.Game.Index extends Backbone.View

  template: JST['backbone/templates/game/index']

  id: "killing-fields"

  initialize: () ->
    @words = @options.words
    @words.bind('reset', @addAll)
    @timer = new Wordz.Models.Game.Timer()
    @listenTo(@timer, 'change:seconds', @addInvader)
    window.timer = @timer

  addInvader: ->
    if @timer.get('time') % 3 == 0
      console.log "add invoke"
      $(".in-orbit").first().removeClass('in-orbit')

  addAll: () ->
    @words.each(@addOne)
    console.log "addAll", @words

    # @$('.question').first().addClass('current')


  addOne: (word) =>
    view = new Wordz.Views.Game.Word(model: word)
    @$el.append(view.render().el)

  render: =>
    @$el.html(@template())
    @timer.play()
    @addAll()
    @