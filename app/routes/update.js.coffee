UpdateIndexRoute = Ember.Route.extend
  model: (params) ->
    debugger
    @modelFor('application').find (joetrack) ->
      joetrack.get("id") == params.update_id

`export default UpdateIndexRoute`
