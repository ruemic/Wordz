module.exports = WordView = Backbone.View.extend
  template: JST['words/word']
  tagName: 'li'
  className: 'word'

  events:
    "click p" : "select"

  initialize: (options) ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html @template(correct: @model.get('correct'), incorrect: @model.get('incorrect'))
    @$el.attr 'id', @model.id
    @

  select: (e) ->
    $t = $(e.currentTarget)
    Backbone.trigger('select:item')
    $t.toggleClass('active')
