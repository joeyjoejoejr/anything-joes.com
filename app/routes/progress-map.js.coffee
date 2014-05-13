`import Joetrack from 'appkit/models/joetrack'`

ProgressMapRoute = Ember.Route.extend
  model: ->
    Joetrack.find(0, 'none')

  actions:
    toggleView: ->
      @get("controller").toggleProperty "showLocal"
      return

    markerClicked: (joetrack) ->
      @transitionTo "update", joetrack

`export default ProgressMapRoute`
