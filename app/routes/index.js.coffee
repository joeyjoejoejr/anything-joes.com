`import Joetrack from 'appkit/models/joetrack'`

Index = Ember.Route.extend
  model: ->
    @modelFor 'application'

  setupController: (controller, model) ->
    controller.set("model", model)
    Joetrack.count().then (total) ->
      controller.set "totalCount", total

  actions:
    clickItem: (joetrack) ->
      @transitionTo "update", joetrack

    loadMore: ->
      controller = @controllerFor("index")
      Joetrack.find(controller.get("offset")).then (results) ->
        controller.pushObjects(results)

`export default Index`
