function getConfigPopUpContent(url) {
  $.ajax({
    type: "GET",
    url: url,
    dataType: "html",
    success: function (response) {
      openConfig();
      $("#save-body-content").html(response);
    },
  });
}
