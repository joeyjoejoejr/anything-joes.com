IndexController = Ember.ArrayController.extend
  needs: "application"
  isStandard: Ember.computed.alias "controllers.application.isStandard"
  sortProperties: ['createdAt']
  sortAscending: false
  loaded: Ember.computed.alias "length"

  remaningToLoad: (->
    @get("totalCount") - @get("loaded")
  ).property("totalCount", "loaded")

  nextLoad: (->
    if @get("remaningToLoad") < 10
      @get "remaningToLoad"
    else
      10
  ).property("remaningToLoad")

  offset: (->
    Math.floor(@get("loaded") / 10)
  ).property("totalCount")

  isFullyLoaded: Ember.computed.lte "nextLoad", 0

`export default IndexController`
