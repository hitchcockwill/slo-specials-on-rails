class SloSpecials.Routers.Main extends Backbone.Router
  initialize: (options) ->
    header = new SloSpecials.Views.Header()
    SloSpecials.header.show header
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

    @bind 'all', (route) ->
      path = window.location.pathname.split('/')
      if path[1] is "deals" then header.activeLink(path[2])
      else header.activeLink(path[1])

  routes:
    '' : 'index'
    'deals/daily/:day' : 'deals'
    'deals/daily' : 'deals'
    'deals/food' : 'food'
    'deals/drinks' : 'drinks'
    'deals' : 'deals'
    'places/:id' : 'venue_by_id'
    'places' : 'venues'

  index: ->
    SloSpecials.content.show new SloSpecials.Views.Index()

  # ###################################################################
  # Deals
  # ###################################################################

  # Deals init
  deals_layout: (day) ->
    layout =  new SloSpecials.Layouts.Deals
      day: day
    SloSpecials.content.show layout
    layout.subnav.show new SloSpecials.Views.DealSubNav
      day: day
    layout

  deals: (day) -> 
    unless day then day = null
    deals_layout = @deals_layout(day)

    title = if day then "Deals by Day" else "All Deals"

    deals = new SloSpecials.Collections.Deals
      day: day
    deals.fetch
      success: ->
        deals_layout.content.show new SloSpecials.Views.AllDeals
          collection: deals
          title: title

  food: (day) ->
    unless day then day = null
    deals_layout = @deals_layout(day)

    deals = new SloSpecials.Collections.Food()
    deals.fetch
      success: ->
        deals_layout.content.show new SloSpecials.Views.AllDeals
          collection: deals
          title: "Food Deals"

  drinks: (day) ->
    unless day then day = null
    deals_layout = @deals_layout(day)

    deals = new SloSpecials.Collections.Drinks()
    deals.fetch
      success: ->
        deals_layout.content.show new SloSpecials.Views.AllDeals
          collection: deals
          title: "Drink Deals"

  # ###################################################################
  # Venues
  # ###################################################################

  venues: ->
    venues = new SloSpecials.Collections.Venues()
    venues.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.AllVenues( collection: venues )

  venue_by_id: (venue_id) ->
    venue = SloSpecials.Models.Venue.findOrCreate( id: venue_id )
    console.log 'called venue by id'
    venue.fetch
      success: ->
        SloSpecials.content.show new SloSpecials.Views.Venue( model: venue )
        