MissPellings.Views.Words ||= {}

class MissPellings.Views.Words.WordView extends Backbone.View
  template: JST["backbone/templates/words/word"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
