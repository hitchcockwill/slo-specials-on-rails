class SloSpecials.Routers.Main extends Backbone.Router
  initialize: (options) ->
    SloSpecials.header.show new SloSpecials.Views.Header()
    SloSpecials.footer.show new SloSpecials.Views.Footer()

    ## Prevent default on links and handle command clicking
    $(document).on 'click', 'a', (evt) ->
      $this = $(this)
      if $this.attr('href')[0] is '/'
        ## check for user voice plugin
        if $this.hasClass('script') then return else evt.preventDefault()
        if evt.metaKey is true then window.open($(this).attr('href'), '_blank')
        else
          SloSpecials.routers.main.navigate $(this).attr('href'), 
            'trigger': true
      else if $this.attr('href') is undefined or $this.attr('href').length is 0 or $this.attr('target') isnt '_blank'
        evt.preventDefault()

  routes:
    '' : 'index'
    'deals-by-day' : 'deals'
    'deals' : 'deals'
    'deals/food' : 'food'
    'food' : 'food'
    'drinks' : 'drinks'
    'places' : 'venues'

  index: ->
    SloSpecials.content.show new SloSpecials.Views.Index()

  deals: -> 
    deals = new SloSpecials.Collections.Deals()
    deals.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.AllDeals( collection: deals )

  food: ->
    deals = new SloSpecials.Collections.Food()
    deals.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.AllDeals( collection: deals )

  drinks: ->
    deals = new SloSpecials.Collections.Drinks()
    deals.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.AllDeals( collection: deals )

  venues: ->
    venues = new SloSpecials.Collections.Venues()
    venues.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.AllVenues( collection: venues )
        