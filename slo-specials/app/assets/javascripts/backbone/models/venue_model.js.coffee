class SloSpecials.Models.Venue extends Backbone.Model

class SloSpecials.Collections.Venues extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/venues"