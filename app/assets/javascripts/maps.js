$(document).ready(function() {
    var postId = $('#map').data('id');

  if(postId) {
    $.get('/posts/' + postId + '.json', function(postInfo) {

      var map = new GMaps({
        div: '#map',
        lat: -12.043333,
        lng: -77.028333
      });

      GMaps.geocode({
        address: postInfo.address, 
        callback: function(results, status) {
          if (status == 'OK') {
            var latlng = results[0].geometry.location;
            map.setCenter(latlng.lat(), latlng.lng());
            map.addMarker({
              lat: latlng.lat(),
              lng: latlng.lng()
            });
          }
        }
      });
    })
  }
})