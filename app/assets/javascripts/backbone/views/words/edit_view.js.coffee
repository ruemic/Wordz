MissPellings.Views.Words ||= {}

class MissPellings.Views.Words.EditView extends Backbone.View
  template: JST["backbone/templates/words/edit"]

  events:
    "submit #edit-word": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (word) =>
        @model = word
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
