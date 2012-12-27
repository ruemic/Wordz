module.exports = ScoreSound = Backbone.View.extend

  initialize: ->
    @successSound = initializeNewWebAudioContext()
    if Modernizr.audio.mp3 == ""
      @successSound.loadSound "/assets/success.ogg", "success"
    else
      @successSound.loadSound "/assets/success.mp3", "success"

    @failSound = initializeNewWebAudioContext()
    if Modernizr.audio.mp3 == ""
      @failSound.loadSound "/assets/fail.ogg", "fail"
    else
      @failSound.loadSound "/assets/fail.mp3", "fail"

  success: ->
    @successSound.playSound 'success'

  fail: ->
    @failSound.playSound 'fail'
