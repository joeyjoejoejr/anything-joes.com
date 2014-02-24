Router = Ember.Router.extend()

Router.map ->
  @route 'progress-map'
  @route 'altitude'
  @resource "update", path: "/update/:update_id"

`export default Router`
