(function(window) {
  document.addEventListener('DOMContentLoaded', function() {
    var $notification = document.getElementById('app-notification');
    var $deleteBtn = $notification.querySelector('.delete');

    $deleteBtn.addEventListener('click', function(e) {
      $notification.remove();
    });
  });
})(window);
