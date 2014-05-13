`import Joetrack from 'appkit/models/joetrack'`

AltitudeRoute = Ember.Route.extend
  model: ->
    Joetrack.find(0, 'none')

  actions: 
    panelClicked: (joetrack) ->
      @transitionTo "update", joetrack

`export default AltitudeRoute`
