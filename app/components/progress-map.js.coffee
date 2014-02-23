ProgressMap = Ember.Component.extend
  id: "map-canvas"
  tagName: "div"
  attributeBindings: ['style']
  style: "width: 100%; height: 90%;"

  map: null

  markers: []
  joecations: Ember.computed.map "joetracks", (joetrack) ->
    joetrack.get 'joecation'

  validJoecations: Ember.computed.filter "joecations", (joecation) ->
    joecation._latitude

  markerUpdater: (->
    @set "markers", @get("validJoecations").map (location) =>
      marker = new google.maps.Marker
        position: new google.maps.LatLng location._latitude,
          location._longitude
        map: @get 'map'

      marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')

      google.maps.event.addListener marker, 'mouseover', (event) =>
        @get("markers").forEach (marker) ->
          marker.setIcon('http://maps.google.com/mapfiles/ms/icons/red-dot.png')

        marker.setIcon('http://maps.google.com/mapfiles/ms/icons/green-dot.png')
        @set "joetrack", @joetrackFromMarker(marker)
      google.maps.event.addListener marker, 'click', (event) =>
        @sendAction 'action', @joetrackFromMarker(marker)

      marker
  ).observes("joetracks", "map")

  joetrackFromMarker: (marker) ->
    @get("joetracks").find (joetrack) ->
      lat = joetrack.get("joecation")._latitude
      long = joetrack.get("joecation")._longitude
      new google.maps.LatLng(lat, long).equals(marker.getPosition())

  reCenterMap: (->
    bounds = new google.maps.LatLngBounds()
    if @get("showLocal")
      bounds.extend @get("markers").get("lastObject").getPosition()
    else
      @get("markers").forEach (marker) ->
        bounds.extend marker.getPosition()

    @get("map").fitBounds(bounds)
  ).observes("markers", "showLocal")

  drawPath: (->
    locations = @get("markers").map (marker) ->
      marker.getPosition()

    path = new google.maps.Polyline
      path: locations
      geodesic: true
      strokeColor: "#FF0000"
      strokeOpacity: 1.0
      strokeWeight: 3

    path.setMap @get("map")
  ).observes("markers")

  didInsertElement: ->
    mapOptions =
      center: new google.maps.LatLng(36.02056995, -78.89257250)
      zoom: 12
      mapTypeId: google.maps.MapTypeId.TERRAIN

    map = new google.maps.Map(@.$().get(0), mapOptions)
    this.set("map", map)


`export default ProgressMap`
