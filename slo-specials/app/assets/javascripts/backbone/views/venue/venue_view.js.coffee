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

  onRender: ->
    # Init plugins
    @$el.find('select.sparkbox-custom').sbCustomSelect()
    @initIsotope()

  onShow: ->
    @initIsotope()

  events: 
    'click ul.radio li' : 'selectRadio'
    'click a.reverse' : 'reverse'

  initIsotope: ->
    @$el.find('#deals-list').isotope
      itemSelector: '.dealTab'
      layoutMode: 'fitRows'
      getSortData:
        price: ($elem) ->
          parseInt($elem.find('.dollars').text())
        name: ($elem) ->
          $elem.find('.name').text()
        venue: ($elem) ->
          $elem.find('.venue').text()
    
    @sortAscending = true

  reverse: (evt) ->
    if evt then evt.preventDefault()
    @sortAscending = if @sortAscending is true then false else true
    @$el.find('#deals-list').isotope( sortAscending: @sortAscending )

  selectRadio: (evt) ->
    if evt then evt.preventDefault()
    $target = $(evt.target)
    if $target.is('a') then $target = $target.parent()

    unless $target.hasClass('active')
      $target.siblings().removeClass('active')
      $target.addClass('active') 

    @sortIsotope($target.attr('data-sorter'))

  sortIsotope: (attribute) ->
    @$el.find('#deals-list').isotope sortBy: attribute
    