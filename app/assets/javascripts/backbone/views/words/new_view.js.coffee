MissPellings.Views.Words ||= {}

class MissPellings.Views.Words.NewView extends Backbone.View
  template: JST["backbone/templates/words/new"]

  events:
    "submit #new-word": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (word) =>
        @model = word
        window.location.hash = "/#{@model.id}"

      error: (word, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
