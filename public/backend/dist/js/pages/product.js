jQuery(function () {
  $("body").on("keyup", "#name", function () {
    var convText = convertToSlug($(this).val());
    $("#url_mask").val(convText);
  });

  $("body").on("click", "#addWithDropzone", function () {
    $("#addWithDropZoneForm").validate({
      submitHandler: function (form) {
        var url = $("#addWithDropZoneForm").attr("action");
        let formData = $("#addWithDropZoneForm").serializeArray();
        var show_on_menu = "No";
        if ($("#show_on_menu").prop("checked") == true) {
          show_on_menu = "Yes";
        }
        var status = "P";
        if ($("#status").prop("checked") == true) {
          status = "A";
        }
        $("#addWithDropzone").text("Please wait...");
        $("#addWithDropzone").attr("disabled", true);
        formData.push({
          name: "show_on_menu",
          value: show_on_menu,
        });
        formData.push({
          name: "status",
          value: status,
        });
        $.ajax({
          type: "POST",
          url: url,
          data: formData,
          dataType: "json",
          success: function (response) {
            if (response.status == 1) {
              $("#addWithDropzone").text("Save");
              $("#addWithDropzone").removeAttr("disabled");
              successMessage("Record saved successfully!");
              closeConfig();
              loadContent();
            } else {
              errorMessage(response.resp);
              $("#addWithDropzone").text("Save");
              $("#addWithDropzone").removeAttr("disabled");
            }
          },
        });
      },
    });
  });
});

function getConfigPopUpContent(url) {
  $.ajax({
    type: "GET",
    url: url,
    dataType: "html",
    success: function (response) {
      openConfig();
      $("#save-body-content").html(response);
      CKEDITOR.replace("content", {
        filebrowserBrowseUrl: roxyFileman,
        filebrowserImageBrowseUrl: roxyFileman + "?type=image",
        removeDialogTabs: "link:upload;image:upload",
        allowedContent: {
          "p h1 h2 h3 h4 h5 h6 div span ul ol li table tr th td blockquote img a br":
            {
              classes: true,
              styles: true,
              attributes: "id,class,href,src,alt,title",
            },
        },
      });
      $(".select2").select2();
      $(".multi-select2").select2();
      dropZoneHandler();
    },
  });
}

function dropZoneHandler() {
  $("div#myDropZone").dropzone({
    // The camelized version of the ID of the form element
    autoProcessQueue: true,
    addRemoveLinks: true,
    parallelUploads: 1,
    url: adminBaseUrl + "/products/addFiles",
    success: function (file, resp) {
      $("#file_name").val(resp);
    },
    init: function () {
      if ($("#old_file_names").val()) {
        myDropzone = this;
        uploadPath = "/uploads/product/" + $("#old_file_names").val();
        var mockFile = {
          name: $("#old_file_names").val(),
          size: null,
        };
        myDropzone.displayExistingFile(mockFile, uploadPath);
      }
    },
    removedfile: function (file) {
      file.previewElement.remove();
      $("#file_name").val("");
      $("#old_file_names").val("");
    },
  });
  $("div#myDropZone2").dropzone({
    // The camelized version of the ID of the form element
    autoProcessQueue: true,
    addRemoveLinks: true,
    parallelUploads: 1,
    url: adminBaseUrl + "/products/addFiles",
    success: function (file, resp) {
      var fileInput =
        "<input type='hidden' name='other_images[]' id='other_image_" +
        file.name +
        "' value='" +
        resp +
        "' />";
      $("#other_image_container_div").append(fileInput);
    },
    init: function () {
      myDropzone = this;
      $(".other_images_multi").each(function (index) {
        var fileName = $(this).val();
        uploadPath = "/uploads/product/" + fileName;
        var mockFile = {
          name: fileName,
          size: null,
        };
        myDropzone.displayExistingFile(mockFile, uploadPath);
      });
    },
    removedfile: function (file) {
      var d = document.getElementById("other_image_container_div");
      var olddiv = document.getElementById("other_image_" + file.name);
      d.removeChild(olddiv);
      file.previewElement.remove();
    },
  });
}

$("body").on("click", "#uploadProductCSV", function () {
  $("#productCsvUpoadForm").validate({
    ignore: [],
    rules: {
      productCSV: {
        required: true,
      },
    },
    submitHandler: function (form) {
      var url = $("#productCsvUpoadForm").attr("action");
      var prodcsv = "1";
      var form_data = new FormData();
      form_data.append("productCSV", $("#productCSV")[0].files[0]);
      form_data.append("prodcsv", prodcsv);
      $.ajax({
        url: url,
        dataType: "json",
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,
        type: "post",
        success: function (result) {
          //alert(JSON.stringify(result));
          if (result.status == 1) {
            successMessage(result.message);
            location.reload();
          } else {
            errorMessage(result.message);
            location.reload();
          }
        },
      });
    },
  });
});
/*
$("body").on("click", "#openCSVForm", function() {
    var url = adminBaseUrl + '/' + controllerName + "/generateProductFromCSV";
    $.ajax({
        type: "GET",
        url: url,
        dataType: "html",
        success: function(response) {
            openConfig();
            alert('Hi');
            $("#save-body-content").html(response);
        }
    });

});
*/
