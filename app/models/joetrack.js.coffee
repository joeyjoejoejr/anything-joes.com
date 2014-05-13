`import Comment from "appkit/models/comment"`

Joetrack = Ember.ObjectProxy.extend
  init: ->
    @set "id", @get("content").id
    @set "createdAt", @get("content").attributes.saved_at
    @set "updatedAt", @get("content").updatedAt
    @set "parseObject", @get "content"
    @set "content", @get("content").attributes
    @fetchComments()

  isNear: "Loading Location"
  altitudeStandard: (->
    "#{Math.round(@get('altitude') * 3.28084)} ft"
  ).property("altitude")

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
      address = data.results[1]
      if address
        @set "isNear", address.formatted_address
      else
        @set "isNear", "Failed to find location"
    .fail =>
      @set "isNear", "Failed to find location"
  ).observes("content.joecation").on 'init'

Joetrack.reopenClass
  count: ->
    joetrack = Parse.Object.extend "Joetrack"
    query = new Parse.Query(joetrack)
    query.count().then (count) -> count

  find: (skip = 0, limit = 10) ->
    limit = null if limit == 'none'

    joetrack = Parse.Object.extend "Joetrack"
    query = new Parse.Query(joetrack)
    query.descending("savedAt")
    query.limit(limit)
    query.skip(skip * 10)
    query.find().then (results) ->
      results.map (joetrack) ->
        Joetrack.create content: joetrack

`export default Joetrack`
