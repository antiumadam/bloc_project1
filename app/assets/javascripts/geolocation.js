navigator.geolocation.getCurrentPosition(function(location) {
  console.log(location);
  $("#ring_latitude").val(location.coords.latitude);
  $("#ring_longitude").val(location.coords.longitude);
  $("#latitude").val(location.coords.latitude);
  $("#longitude").val(location.coords.longitude);
})