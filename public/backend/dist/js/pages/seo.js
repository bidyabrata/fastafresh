jQuery(function() {
      $("body").on('click', '#addSEO', function() {
        $("#addSEOFrm").validate({
            submitHandler: function(form) {
                var url = $("#addSEOFrm").attr("action");
                let formData = $("#addSEOFrm").serializeArray();    
                $("#addSEO").text("Please wait...")
                $("#addSEO").attr("disabled", true)               
               
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if (response.status == 1) {
                            $("#addSEO").text("Save");
                            $("#addSEO").removeAttr("disabled");
                            successMessage("SEO saved successfully!");
                            closeConfig();
                            loadContent();
                        } else {
                            errorMessage(response.resp);
                            $("#addSEO").text("Save");
                            $("#addSEO").removeAttr("disabled");
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
        }
    });
}

