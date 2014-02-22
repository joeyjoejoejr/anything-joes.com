Comment = Ember.ObjectProxy.extend
  init: ->
    @set "id", @get("content").id
    @set "createdAt", @get("content").createdAt
    @set "updatedAt", @get("content").updatedAt
    @set "parseObject", @get "content"
    @set "content", @get("content").attributes

`export default Comment`
