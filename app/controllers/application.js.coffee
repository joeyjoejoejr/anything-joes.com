ApplicationController = Ember.Controller.extend
  currentURL: (->
    window.location.href.replace("#", "%23")
  ).property('currentPath')

  facebookURL: (->
    "https://www.facebook.com/sharer/sharer.php?u=#{@get('currentURL')}"
  ).property('currentURL')

`export default ApplicationController`
