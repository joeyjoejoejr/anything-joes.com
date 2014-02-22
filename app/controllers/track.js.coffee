TrackController = Ember.ObjectController.extend
  actions:
    toggleComments: ->
      @toggleProperty "commentsShown"
      return

    addComment: ->
      @set 'addingComment', true

    closeComment: ->
      @set 'addingComment', false

    createComment: ->
      Comment = Parse.Object.extend("Comment")
      comment = new Comment()
      comment.set "author", @get("author")
      comment.set "comment", @get("comment")
      comment.set "subject", @get('parseObject')
      if @get("author") and @get("comment")
        comment.save().then (comment) =>
          @set 'author', ''
          @set 'comment', ''
          @set 'addingComment', false
          @get('model').addComment comment

`export default TrackController`
