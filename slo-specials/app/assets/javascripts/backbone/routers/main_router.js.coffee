class SloSpecials.Routers.Main extends Backbone.Router
  initialize: (options) ->
    SloSpecials.header.show new SloSpecials.Views.Header()
    SloSpecials.footer.show new SloSpecials.Views.Footer()

  routes:
    '' : 'index'
    'deals' : 'deals'
    'deals/food' : 'deals_food'

  index: ->
    SloSpecials.content.show new SloSpecials.Views.Index()

  deals: -> 
    deals = new SloSpecials.Collections.Deals()
    deals.fetch()
    console.log 'deals', deals, deals.length

