class SloSpecials.Models.Deal extends Backbone.RelationalModel

class SloSpecials.Collections.Deals extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals"

  initialize: (options) ->
    if options.day
      @url = "/api/v1/day/" + options.day

class SloSpecials.Collections.Food extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals/food"

class SloSpecials.Collections.Drinks extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals/drink"
