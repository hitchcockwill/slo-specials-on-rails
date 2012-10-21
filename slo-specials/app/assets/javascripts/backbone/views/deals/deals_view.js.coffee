class SloSpecials.Views.Deal extends Backbone.Marionette.ItemView
  template: JST['deals/deal']
  className: "clearfix fL"
  tagName: "li"

  initialize: ->
    @model.on 'change', @render, this
    console.log 'item view working', @model.toJSON(), @model.toJSON().venue

class SloSpecials.Views.AllDeals extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.Deal
  template: JST['deals/alldeals']
  className: "clearfix"

  initialize: ->
    @collection.on 'change', @render, this
    console.log 'called the collection', @collection

  appendHtml: (collectionView, itemView) ->
    collectionView.$('#deal-list').append(itemView.el)
