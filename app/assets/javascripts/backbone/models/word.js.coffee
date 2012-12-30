class Wordz.Models.Word extends Backbone.Model
  paramRoot: 'word'

  defaults:
    word: null
    correct: null

class Wordz.Collections.WordsCollection extends Backbone.Collection
  model: Wordz.Models.Word
  url: '/game?spelling=true'

