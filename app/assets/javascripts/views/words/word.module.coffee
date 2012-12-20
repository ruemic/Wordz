module.exports = WordView = Backbone.View.extend
  template: JST['words/word']
  tagName: 'li'
  className: 'word'

  events:
    "click p" : "select"

  initialize: (options) ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'change', @updateActive)


  render: ->
    @$el.html @template(correct: @model.get('correct'), incorrect: @model.get('incorrect'))
    @$el.attr 'id', @model.id
    @

  select: (e) ->
    spelling = $(e.currentTarget).text()
    if @model.isCorrect(spelling)
      @model.set("answer":"correct")
    else
      @model.set("answer":"incorrect")

  updateActive: (e) ->
    console.log @model
    console.log @model.get('correct')
    console.log e, "update"
    # if @$('p').toggleClass('active')
