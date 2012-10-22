class SloSpecials.Views.Header extends Backbone.Marionette.ItemView
  template: JST['header']
  className: "clearfix"

  onRender: ->
    ## Set router change events
    # SloSpecials.routers.main.bind 'all', (route) =>
    #   ## Change header active link
    #   location = window.location.pathname.split('/')
    #   @activeLink()
    # , this

  activeLink: (target) ->
    
    nav = @$el.find('ul')
    nav.children().removeClass('active')
    nav.find('li.'+target).addClass('active')
    console.log 'called active links', target, nav.find('li.'+target)
