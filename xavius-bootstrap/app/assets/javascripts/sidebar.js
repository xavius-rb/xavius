$(document).on('turbolinks:load', function() {
  const sidebar =  document.querySelector('.body__sidebar');
  let zoomOutLeft = false;

  sidebar.addEventListener('animationend', function() {
    if (zoomOutLeft) {
      sidebar.classList.toggle("hidden");
    }
  });

  $("#sidebarIcon").on("click", function () {
    if (sidebar.classList.contains("hidden")) {
      zoomOutLeft = false;
      sidebar.classList.toggle("hidden");
      sidebar.classList.remove('zoomOutLeft');
      sidebar.classList.add('animated', 'zoomInLeft');
    } else {
      sidebar.classList.remove('zoomInLeft');
      sidebar.classList.add('animated', 'zoomOutLeft');
      zoomOutLeft = true;
    }
  });
});