`import Comment from "appkit/models/comment"`

Joetrack = Ember.ObjectProxy.extend
  init: ->
    @set "id", @get("content").id
    @set "createdAt", @get("content").createdAt
    @set "updatedAt", @get("content").updatedAt
    @set "parseObject", @get "content"
    @set "content", @get("content").attributes

  isNear: "Loading Location"

  moodUrl: (->
    "/assets/mood#{@get("mood")}.png"
  ).property("mood")

  comments: []
  fetchComments: ->
      comment = Parse.Object.extend "Comment"
      query = new Parse.Query comment
      query.equalTo "subject", @get("parseObject")
      query.descending("createdAt")
      query.find().then (results) =>
        @set "comments", results.map (comment) ->
          Comment.create content: comment

  addComment: (comment) ->
    newComment = Comment.create content: comment
    @get("comments").unshiftObject newComment

  updateLocation: (->
    $.getJSON "http://maps.google.com/maps/api/geocode/json",
      latlng: @get("joecation.latitude").toString() + "," +
              @get("joecation.longitude").toString()
      sensor: false
    .done (data) =>
      address = data.results.find (value) ->
        value.types.contains("administrative_area_level_2")
      if address
        @set "isNear", address.formatted_address
      else
        @set "isNear", "Failed to find location"
    .fail =>
      @set "isNear", "Failed to find location"
  ).observes("content.joecation").on 'init'

Joetrack.reopenClass
  find: ->
    joetrack = Parse.Object.extend "Joetrack"
    query = new Parse.Query(joetrack)
    query.find().then (results) ->
      results.map (joetrack) ->
        Joetrack.create content: joetrack

`export default Joetrack`
