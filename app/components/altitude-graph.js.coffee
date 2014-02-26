AltitudeGraph = Ember.Component.extend
  classNames: ["altitude-graph"]
  tagName: "div"
  attributeBindings: ['style']
  style: "width: 100%; height: 80%;"

  updateDate: (->
    @get("chart").setData @get("data")
  ).observes "data"

  data: (->
    @get('joetracks').map (joetrack) ->
      y: moment(joetrack.get('createdAt')).format("YYYY-MM-DD HH:mm")
      x: joetrack.get("altitude")
  ).property('joetracks')

  click: (e)->
    if e.target.nodeName == "circle"
      @sendAction 'action', @get("joetrack")

  standardObserver: (->
    @get("chart").yLabelFormat = (height) =>
      if @get "isStandard"
        "#{Math.round(height * 3.28084)} ft"
      else
        "#{Math.round(height)} M"
    @get("chart").setData @get("data")
  ).observes "isStandard"

  didInsertElement: ->
    @set "chart", new Morris.Line
      element: @.$().get(0)
      data: @get 'data'
      xkey: 'y'
      ykeys: ['x']
      labels: ['Altitude']
      xLabelFormat: (date) ->
        moment(date).fromNow()
      yLabelFormat: (height) =>
        if @get "isStandard"
          "#{Math.round(height * 3.28084)} ft"
        else
          "#{Math.round(height)} M"
      hoverCallback: (index, options, content) =>
        @set "joetrack", @get("joetracks")[index]

`export default AltitudeGraph`
