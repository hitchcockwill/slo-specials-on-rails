class SloSpecials.Views.About extends Backbone.Marionette.ItemView
  template: JST['support/about']
  className: "clearfix"
  id: "about"

  initialize: ->
    console.log 'got the about vie'