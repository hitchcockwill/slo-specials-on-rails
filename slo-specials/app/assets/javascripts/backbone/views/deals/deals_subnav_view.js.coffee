class SloSpecials.Views.DealSubNav extends Backbone.Marionette.ItemView
  template: JST['deals/subnav']
  className: "clearfix subnav box1 fL"
  tagName: "ul"

  initialize: (options) ->
    if options.day then @day = options.day

  onShow: ->
    if @day and @day isnt "today" and @day isnt "all"
      @$el.find("li."+@day).addClass("active")
    else if @day and @day is "today"
      date = new Date
      today = SloSpecials.helpers.daysArray[date.getDay()]
      @$el.find("li."+today).addClass("active")
    else
      @$el.find("li.all").addClass("active")
