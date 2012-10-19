class SloSpecials.Routers.HeadersRouter extends Backbone.Router
  initialize: (options) ->
    @headers = new SloSpecials.Collections.HeadersCollection()
    @headers.reset options.headers

  routes:
    "new"      : "newHeader"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newHeader: ->
    @view = new SloSpecials.Views.Headers.NewView(collection: @headers)
    $("#headers").html(@view.render().el)

  index: ->
    @view = new SloSpecials.Views.Headers.IndexView(headers: @headers)
    $("#headers").html(@view.render().el)

  show: (id) ->
    header = @headers.get(id)

    @view = new SloSpecials.Views.Headers.ShowView(model: header)
    $("#headers").html(@view.render().el)

  edit: (id) ->
    header = @headers.get(id)

    @view = new SloSpecials.Views.Headers.EditView(model: header)
    $("#headers").html(@view.render().el)
