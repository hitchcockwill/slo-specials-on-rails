#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers
#= require_tree ./layouts

window.SloSpecials = new Backbone.Marionette.Application()

SloSpecials.Models = {}
SloSpecials.Collections = {}
SloSpecials.Routers = {}
SloSpecials.Views = {}
SloSpecials.Layouts = {}

SloSpecials.routers = {}
SloSpecials.models = {}
SloSpecials.collections = {}
SloSpecials.views = {}

SloSpecials.addRegions
  header: 'header'
  content: '#content'
  footer: 'footer'

SloSpecials.addInitializer ->
  SloSpecials.routers.main = new SloSpecials.Routers.Main()
  Backbone.history.start pushState: true

jQuery ->
  SloSpecials.start()
