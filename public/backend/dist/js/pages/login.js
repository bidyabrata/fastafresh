jQuery(function() {
    $("body").on('click', '#login', function() {
        $("#loginForm").validate({
            submitHandler: function(form) {
                var url = $("#loginForm").attr("action");
                let formData = $("#loginForm").serializeArray();
                $("#login").text("Please wait...")
                $("#login").attr("disabled", true)
                $.ajax({
                    type: "POST",
                    url: url,
                    data: formData,
                    dataType: "json",
                    success: function(response) {
                        if (response.status == 1) {
                            $("#login").text("Sign In");
                            $("#login").removeAttr("disabled");
                            window.location = response.resp;
                        } else {
                            errorMessage('Wrong Credential');
                            $("#login").text("Sign In");
                            $("#login").removeAttr("disabled");
                        }
                    }
                });
            }
        });
    });
});