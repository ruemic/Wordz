QuestionView = require('./question')

module.exports = QuestionIndexView = Backbone.View.extend
  el: "#content"

  initialize: ->
    @collection.on('add reset', @render, @)

  render: ->
    @$('#words').html ''
    @collection.each @addOne
    @

  addOne: (question) =>
    view = new QuestionView(model: question)
    @$('#words').append view.render().el

