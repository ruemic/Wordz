QuestionView = require('./question')

module.exports = QuestionIndexView = Backbone.View.extend
  el: "#content"

  initialize: ->
    @collection.on('add reset', @render, @)
    Mousetrap.bind ',', ->
      @$(".current").find(".word").first().click()
    Mousetrap.bind '.', ->
      @$(".current").find(".word").last().click()
    @

  render: ->
    @$('#words').html ''
    @collection.each @addOne
    @$('.question').first().addClass('current')
    @

  addOne: (question) =>
    view = new QuestionView(model: question)
    @$('#words').append view.render().el

