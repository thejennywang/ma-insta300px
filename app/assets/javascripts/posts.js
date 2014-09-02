var pusher = new Pusher('3522eb986cc25bcb20e2');
var channel = pusher.subscribe('theinstagramapp_channel');

$(document).ready(function() {
  channel.bind('new_upload', function(data) {
    var newPost = Mustache.render($('#post_template').html(), data)
    $(newPost).prependTo("main .row");
  });
});