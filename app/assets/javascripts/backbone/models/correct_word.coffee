class Wordz.Models.CorrectWord extends Backbone.Model
  paramRoot: 'word'

  defaults:
    word: null
    correct: null

class Wordz.Collections.CorrectWordsCollection extends Backbone.Collection
  model: Wordz.Models.CorrectWord
  url: '/words'

  initialize: ->
    console.log "correct words"