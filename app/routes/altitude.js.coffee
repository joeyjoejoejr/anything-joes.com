AltitudeRoute = Ember.Route.extend
  model: ->
    @modelFor 'application'

  actions: 
    panelClicked: (joetrack) ->
      @transitionTo "update", joetrack

`export default AltitudeRoute`
