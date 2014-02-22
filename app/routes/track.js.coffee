`import Joetrack from 'appkit/models/joetrack'`

Index = Ember.Route.extend
  model: (params) ->
    Ember.Object.extend track_id: params.track_id

`export default Index`
