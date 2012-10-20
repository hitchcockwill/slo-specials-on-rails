class SloSpecials.Routers.Main extends Backbone.Router
  initialize: (options) ->
    SloSpecials.header.show new SloSpecials.Views.Header()

  routes:
    '' : 'index'

  index: ->
    console.log 'index logged'
