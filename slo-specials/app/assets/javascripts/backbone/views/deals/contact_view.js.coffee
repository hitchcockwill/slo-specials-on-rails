class SloSpecials.Views.Contact extends Backbone.Marionette.ItemView
  template: JST['support/contact']
  className: "clearfix"
  id: "contact"

  initialize: ->
    console.log 'got the contact vie'