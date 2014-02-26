ApplicationController = Ember.Controller.extend
  currentURL: (->
    window.location.href.replace("#", "%23")
  ).property('currentPath')

  facebookURL: (->
    "https://www.facebook.com/sharer/sharer.php?u=#{@get('currentURL')}"
  ).property('currentURL')

  standardText: (->
    if @get "isStandard"
      "Swith to metric"
    else
      "Switch to Standard"
  ).property "isStandard"

  isStandard: (->
    if localStorage.isStandard == "true"
      localStorage.isStandard
  )()

  actions:
    toggleStandard: ->
      @toggleProperty "isStandard"
      localStorage.isStandard = @get "isStandard"
      return

`export default ApplicationController`
