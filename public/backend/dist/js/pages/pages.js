jQuery(function() {
    $("body").on('keyup', '#name', function() {
        var convText = convertToSlug($(this).val());
        $("#url_mask").val(convText);
    });

    $("body").on('click', '#addWithDropzone', function() {
        $("#addWithDropZoneForm").validate({
            submitHandler: function(form) {
                var url = $("#addWithDropZoneForm").attr("action");
                let formData = $("#addWithDropZoneForm").serializeArray();
                var headfoot = "No";
                if ($("#headfoot").prop("checked") == true) {
                    headfoot = "Yes";
                }
                var status = 'P';
                if ($("#status").prop("checked") == true) {
                    status = 'A';
                }
                $("#addWithDropzone").text("Please wait...")
                $("#addWithDropzone").attr("disabled", true)
                formData.push({
                    name: "headfoot",
                    value: headfoot
                });
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
            CKEDITOR.replace('content', {
                filebrowserBrowseUrl: roxyFileman,
                filebrowserImageBrowseUrl: roxyFileman + '?type=image',
                removeDialogTabs: 'link:upload;image:upload'
            });
            $(".select2").select2();
        }
    });
}
