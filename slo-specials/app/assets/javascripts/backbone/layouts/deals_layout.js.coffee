class SloSpecials.Layouts.Deals extends Backbone.Marionette.Layout
  template: JST["layouts/deals"]
  className: 'clearfix'
  id: 'deals-layout'

  regions:
    content: '#deals-layout-content'
    subnav: '#deals-layout-subnav'
