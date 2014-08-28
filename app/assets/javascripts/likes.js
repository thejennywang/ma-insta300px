$(document).ready(function() {
  $('.like-btn ').on('click', function(event) {
    var likeCount = $(this).find('.like_count')

    event.preventDefault();
    
    $.post(this.href, function(response) {
      likeCount.text(response.new_like_count);
    });
  })
})