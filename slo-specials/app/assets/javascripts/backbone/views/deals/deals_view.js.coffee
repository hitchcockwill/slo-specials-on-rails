class SloSpecials.Views.Deal extends Backbone.Marionette.ItemView
  template: JST['deals/deal']
  className: "clearfix dealTab box2"
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

  onRender: ->
    # Init plugins
    @$el.find('select.sparkbox-custom').sbCustomSelect()
    @initIsotope()

  onShow: ->
    @initIsotope()

  events: 
    'click ul.radio li' : 'selectRadio'

  initIsotope: ->
    @$el.find('#deal-list').isotope
      itemSelector: '.dealTab'
      layoutMode: 'fitRows'
      getSortData:
        price: ($elem) ->
          parseInt($elem.find('.dollars').text())
        name: ($elem) ->
          $elem.find('.name').text()
        venue: ($elem) ->
          $elem.find('.venue').text()

  selectRadio: (evt) ->
    if evt then evt.preventDefault()
    $target = $(evt.target)
    if $target.is('a') then $target = $target.parent()

    unless $target.hasClass('active')
      $target.siblings().removeClass('active')
      $target.addClass('active') 

    @sortIsotope($target.attr('data-sorter'))

  sortIsotope: (attribute) ->
    @$el.find('#deal-list').isotope sortBy: attribute

