UpdateIndexRoute = Ember.Route.extend
  model: (params) ->
    @modelFor('application').find (joetrack) ->
      joetrack.get("id") == params.update_id

`export default UpdateIndexRoute`
