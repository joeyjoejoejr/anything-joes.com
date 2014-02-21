`import Joetrack from 'appkit/models/joetrack'`

Index = Ember.Route.extend
  model: ->
    Joetrack.find()

`export default Index`
