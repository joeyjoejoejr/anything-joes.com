AltitudeController = Ember.ArrayController.extend
  filteredJoetracks: (->
    tracks = @get("model").filter (joetrack) =>
      if @get('start') or @get('end')
        startTime = moment().subtract parseInt(@get('start')), "days" if @get('start')
        endTime = moment().subtract parseInt(@get('end')), "days" if @get('end')
        moment(joetrack.get("createdAt")).isAfter(startTime) and
        moment(joetrack.get("createdAt")).isBefore(endTime)
      else
        true
  ).property("start", "end")

`export default AltitudeController`
