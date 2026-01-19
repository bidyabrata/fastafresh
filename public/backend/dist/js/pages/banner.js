jQuery(function() {

    $("body").on('click', '#addWithDropzone', function() {
        $("#addWithDropZoneForm").validate({
            submitHandler: function(form) {
                var url = $("#addWithDropZoneForm").attr("action");
                let formData = $("#addWithDropZoneForm").serializeArray();
                var status = 'P';
                if ($("#status").prop("checked") == true) {
                    status = 'A';
                }
                $("#addWithDropzone").text("Please wait...")
                $("#addWithDropzone").attr("disabled", true)
                formData.push({
                    name: "status",
                    value: status
                });
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if (response.status == 1) {
                            $("#addWithDropzone").text("Save");
                            $("#addWithDropzone").removeAttr("disabled");
                            successMessage("Category saved successfully!");
                            closeConfig();
                            loadContent();
                        } else {
                            errorMessage(response.resp);
                            $("#addWithDropzone").text("Save");
                            $("#addWithDropzone").removeAttr("disabled");
                        }
                    }
                });
            }
        });
    });
});

function getConfigPopUpContent(url) {
    $.ajax({
        type: "GET",
        url: url,
        dataType: "html",
        success: function(response) {
            openConfig();
            $("#save-body-content").html(response);
            $(".select2").select2();
            dropZoneHandler();
        }
    });
}

function dropZoneHandler() {
    $("div#myDropZone").dropzone({ // The camelized version of the ID of the form element
        autoProcessQueue: true,
        addRemoveLinks: true,
        parallelUploads: 1,
        url: adminBaseUrl + "/banner/addFiles",
        success: function(file, resp) {
            $("#file_name").val(resp);
        },
        init: function() {
            if ($("#old_file_name").val()) {
                myDropzone = this;
                uploadPath = "/uploads/banner/" + $("#old_file_name").val();
                var mockFile = {
                    name: $("#old_file_name").val(),
                    size: null,
                    pathname: "/uploads/banner/" + $("#old_file_name").val()
                };

                myDropzone.emit("addedfile", mockFile);
                myDropzone.emit("thumbnail", mockFile, uploadPath);
                myDropzone.emit("complete", mockFile);
            }
        },
        removedfile: function(file) {
            file.previewElement.remove();
            $("#file_name").val("");
            $("#old_file_names").val("");
        }
    })
}