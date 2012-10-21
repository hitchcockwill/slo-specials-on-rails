class SloSpecials.Views.Deal extends Backbone.Marionette.ItemView
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

class SloSpecials.Views.AllDeals extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.Deal
  template: JST['deals/alldeals']
  className: "clearfix"

  initialize: (options) ->
    if options.title
      @model = new Backbone.Model(title: options.title)
    @collection.on 'change', @render, this
    console.log 'called the collection', @collection

  appendHtml: (collectionView, itemView) ->
    collectionView.$('#deal-list').append(itemView.el)
