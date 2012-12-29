MissPellings.Views.Words ||= {}

class MissPellings.Views.Words.ShowView extends Backbone.View
  template: JST["backbone/templates/words/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
