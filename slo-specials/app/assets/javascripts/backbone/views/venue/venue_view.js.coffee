class SloSpecials.Views.VenueDeal extends Backbone.Marionette.ItemView
  template: JST['deals/deal']
  className: "clearfix fL dealTab box2"
  tagName: "li"

  initialize: ->
    @model.on 'change', @render, this
  
  onShow: ->
    header = @$el.find("h3")
    lineheight = header.css("line-height").replace("px", "")

    if parseInt(lineheight)*3 < header.height() then header.addClass("triple")
    else if parseInt(lineheight)*2 < header.height() then header.addClass("triple")
    else if parseInt(lineheight) < header.height() then header.addClass("double")

class SloSpecials.Views.Venue extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.VenueDeal
  template: JST['venue/venuewrap']
  className: "clearfix"
  id: "places-page"

  initialize: ->
    @collection = @model.get('deals')
    @model.on 'change', @render, this
    console.log 'Show single venue', @collection

  appendHtml: (collectionView, itemView) ->
    collectionView.$('#deals-list').append(itemView.el)
