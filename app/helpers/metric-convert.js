export default Ember.Handlebars.makeBoundHelper(function(meters, isStandard) {
  if(isStandard) {
    return Math.round(meters * 3.28084) + " ft";
  } else {
    return Math.round(meters) + " M";
  }
});
