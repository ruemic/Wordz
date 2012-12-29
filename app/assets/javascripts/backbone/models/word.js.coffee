class MissPellings.Models.Word extends Backbone.Model
  paramRoot: 'word'

  defaults:
    word: null
    correct: null

class MissPellings.Collections.WordsCollection extends Backbone.Collection
  model: MissPellings.Models.Word
  url: '/words'
