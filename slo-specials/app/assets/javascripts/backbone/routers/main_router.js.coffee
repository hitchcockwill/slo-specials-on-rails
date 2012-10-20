class SloSpecials.Routers.Main extends Backbone.Router
  initialize: (options) ->
    SloSpecials.header.show new SloSpecials.Views.Header()
    SloSpecials.footer.show new SloSpecials.Views.Footer()

  routes:
    '' : 'index'

  index: ->
    SloSpecials.content.show new SloSpecials.Views.Index()
