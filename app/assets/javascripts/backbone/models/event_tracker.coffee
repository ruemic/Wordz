class Wordz.Models.EventTracker extends Backbone.Model


  triggerScoreChange: (opts) ->
    console.log "trigger score change in trackke"
    @.trigger('scoreChange', opts)