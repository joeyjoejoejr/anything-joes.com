Router = Ember.Router.extend()

Router.map ->
  this.route('component-test')
  this.route('helper-test')
  @route 'progress-map'
  @resource "update", path: "/update/:update_id"

`export default Router`
