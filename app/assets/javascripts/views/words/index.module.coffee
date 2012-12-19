WordView = require('./word')

module.exports = WordIndexView = Backbone.View.extend
  el: "#content"

  initialize: ->
    @collection.on('add reset', @render, @)

  render: ->
    @$('#words').html ''
    @collection.each @addOne
    @

  addOne: (word) =>
    view = new WordView(model: word)
    @$('#words').append view.render().el

