class SloSpecials.Models.Deal extends Backbone.Model

class SloSpecials.Collections.Deals extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/deals"