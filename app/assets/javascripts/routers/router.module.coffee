Game       = require('models/game')
Words      = require('collections/words')
GameView   = require('views/game')

module.exports = WordsRouter = Backbone.Router.extend

  routes:
    ''     : 'game'
    'about': 'about'

  game: ->
    words = new Words(page: 1)
    words.fetch
      success: (collection) ->
        window.game = new Game(words:collection)

    new GameView(collection: words).render()

  about: ->
    console.log "tell people about the game here"