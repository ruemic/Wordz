class Wordz.Models.GameMaster extends Backbone.Model

  initialize: ->
    console.log "gametime"
    @eventTracker = Wordz.get('eventTracker')
    @eventTracker.on('checkSpelling', @checkSpelling.bind(@))


  isCorrect: (word) ->
    if word is @.correctWord()
      @.set(answered_correctly: true)
      return true
    else
      @.set(answered_incorrectly: true)
      return false
    return

  checkSpelling: (word) ->
    console.log "check checkSpelling", word

