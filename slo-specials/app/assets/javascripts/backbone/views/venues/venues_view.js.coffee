class SloSpecials.Views.VenueThumb extends Backbone.Marionette.ItemView
  template: JST['venues/venuethumb']
  className: "clearfix fL dealTab placesTab box2"
  tagName: "li"

  initialize: ->
    @model.on 'change', @render, this
  
  onShow: ->
    header = @$el.find("h3")
    lineheight = header.css("line-height").replace("px", "")

    if parseInt(lineheight)*3 < header.height() then header.addClass("triple")
    else if parseInt(lineheight)*2 < header.height() then header.addClass("triple")
    else if parseInt(lineheight) < header.height() then header.addClass("double")

class SloSpecials.Views.AllVenues extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.VenueThumb
  template: JST['venues/allvenues']
  className: "clearfix"

  initialize: ->
    @collection.on 'change', @render, this
    console.log 'called the collection', @collection

  appendHtml: (collectionView, itemView) ->
    collectionView.$('#venue-list').append(itemView.el)
