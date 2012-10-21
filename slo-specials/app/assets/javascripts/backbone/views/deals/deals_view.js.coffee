class SloSpecials.Views.Deal extends Backbone.Marionette.ItemView
  template: JST['deals/deal']
  className: "clearfix fL dealTab box2"
  tagName: "li"

  initialize: ->
    @model.on 'change', @render, this
  
  onShow: ->
    header = @$el.find("h3")
    lineheight = header.css("line-height").replace("px", "")

    if parseInt(lineheight)*3 < header.height()
      header.addClass("triple")
      console.log 'Quad'
    else if parseInt(lineheight)*2 < header.height()
      header.addClass("triple")
      console.log "triple"
    else if parseInt(lineheight) < header.height()
      header.addClass("double")
      console.log "double"
    else
     console.log parseInt(lineheight), header.height(), parseInt(lineheight) > header.height()

    # function dealListStyleFix() {  
    #   var dealTabH3 = $(".dealTab h3");
    #   var singleRowHeight = 80;
    #   var doubleRowHeight = 100;
    #   dealTabH3.each(function(){
    #     var thisH3 = $(this);
    #     if(thisH3.innerHeight() > singleRowHeight && thisH3.innerHeight() > doubleRowHeight ) {
    #       thisH3.css({"padding":"7px 0"});
    #     }
    #     else if (thisH3.innerHeight() > singleRowHeight) {
    #       thisH3.css({"padding":"16px 0"});
    #     }
    #   });
    # }

class SloSpecials.Views.AllDeals extends Backbone.Marionette.CompositeView
  itemView: SloSpecials.Views.Deal
  template: JST['deals/alldeals']
  className: "clearfix"

  initialize: ->
    @collection.on 'change', @render, this
    console.log 'called the collection', @collection

  appendHtml: (collectionView, itemView) ->
    collectionView.$('#deal-list').append(itemView.el)
