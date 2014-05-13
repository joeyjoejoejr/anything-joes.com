`import Joetrack from 'appkit/models/joetrack'`

ApplicationRoute = Ember.Route.extend
  model: ->
    Joetrack.find()

  setupController: (controller, model) ->
    controller.set("model", model)
    Joetrack.count().then (total) ->
      controller.set "totalCount", total

`export default ApplicationRoute`
