class SloSpecials.Models.Venue extends Backbone.RelationalModel
  urlRoot: "/api/v1/venues/"

  'relations' : [
    'type' : Backbone.HasMany
    'key' : 'deals'
    'relatedModel' : 'SloSpecials.Models.Deal'
    'collectionType' : 'SloSpecials.Collections.Deals'
    'reverseRelation' :
      'key' : 'venue'
      'incldueInJSON' : 'id'
  ]

class SloSpecials.Collections.Venues extends Backbone.Collection
  model: SloSpecials.Models.Deal
  url: "/api/v1/venues"