`import Joetrack from 'appkit/models/joetrack'`

ApplicationRoute = Ember.Route.extend
  model: ->
    Joetrack.find()

`export default ApplicationRoute`
