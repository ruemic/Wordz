module.exports = WordView = Backbone.View.extend
  template: JST['words/word']
  tagName: 'li'
  className: 'panel dream'

  initialize: (options) ->
    # @listenTo(@model, 'change', @render)

  render: ->
    @$el.html @template(correct: @model.get('correct'), incorrect: @model.get('incorrect'))
    @$el.attr 'id', @model.id
    @