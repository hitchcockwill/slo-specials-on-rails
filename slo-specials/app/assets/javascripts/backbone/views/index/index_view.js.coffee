class SloSpecials.Views.Index extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.Deal
  template: JST['index/index']
  className: "clearfix"
  id: "homepage"

  appendHtml: (collectionView, itemView) ->
    collectionView.$('ul.dealList').append(itemView.el)
