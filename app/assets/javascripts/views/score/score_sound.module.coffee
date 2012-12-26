module.exports = ScoreSound = Backbone.View.extend

  initialize: ->
    @successSound = initializeNewWebAudioContext()
    if Modernizr.audio.mp3 == ""
      @successSound.loadSound "/assets/success.ogg", "success"
    else
      @successSound.loadSound "/assets/success.mp3", "success"

  success: ->
    @successSound.playSound 'success'
