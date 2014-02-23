initializer =
  name: "googleMapsInit"
  initialize: ->
    App.deferReadiness()
    $.getScript "https://maps.googleapis.com/maps/api/js?key=AIzaSyDcHcLNPBKqjXKYKzFt2aTGTev3Mkf5Z9w&sensor=false&callback=mapsLoaded"

window.mapsLoaded = -> App.advanceReadiness()

`export default initializer`
