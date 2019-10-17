$(document).on('turbolinks:load', function() {
  const $modalContainer = $("#modal");
  const $modal = $(".modal", $modalContainer);

  $(document).on("click", "a[data-modal='true']", function (e) {
    let $link = $(this);

    e.preventDefault();

    let modalContentPath = $link.attr("href");
    $.get(modalContentPath, function (data) {
      $modal.html(data);
      $modal.modal();
    });
  });

  $modal.on('shown.bs.modal', function (e) {
  });

  $modal.on('hidden.bs.modal', function (e) {
    $(".modal-backdrop").remove();
  });

  $(document).on("ajax:success", "form", function (event) {
    $modal.modal("hide");
  });

  $(document).on("ajax:error", "form", function(event) {
    [data, status, xhr] = event.detail;

    if (xhr.status != 401) {
      $(this).html(xhr.responseText);
    }
  });
});
