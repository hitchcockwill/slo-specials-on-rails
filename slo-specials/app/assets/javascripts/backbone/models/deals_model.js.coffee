class SloSpecials.Models.Deal extends Backbone.Model

class SloSpecials.Collections.Deals extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals"

class SloSpecials.Collections.Food extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals/food"

class SloSpecials.Collections.Drinks extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals/drinks"
