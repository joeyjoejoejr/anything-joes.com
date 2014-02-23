TruncateText = Ember.Handlebars.makeBoundHelper (str, len) ->
  if str.length > len
    "#{str.substring(0, len - 3)} &#8230;".htmlSafe()
  else
    str

`export default TruncateText`

