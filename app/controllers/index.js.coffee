IndexController = Ember.ArrayController.extend
  needs: "application"
  isStandard: Ember.computed.alias "controllers.application.isStandard"
  sortProperties: ['createdAt']
  sortAscending: false

`export default IndexController`
