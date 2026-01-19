function convertToSlug(text) {
    return text
        .toLowerCase()
        .replace(/ /g, '-')
        .replace(/[^\w-]+/g, '');
}

function successMessage(msg) {
    $(document).Toasts('create', {
        class: 'bg-success',
        title: 'Success',
        body: msg
    });
}

function errorMessage(msg) {
    $(document).Toasts('create', {
        class: 'bg-danger',
        title: 'Error',
        body: msg
    })
}

function closeConfig() {
    $("body").removeClass("control-sidebar-slide-open");
    $(".control-sidebar").css("display", "none");
}

function openConfig() {
    $("body").addClass("control-sidebar-slide-open");
    $(".control-sidebar").css("display", "block");
}

function loadContent(url = '') {
    if (!url) {
        url = window.location.href;
    }
    $.ajax({
        type: "GET",
        url: url,
        dataType: "html",
        success: function(response) {
            $("#landing-content").html(response);
        }
    });
}

jQuery(function() {
    $("body").on("click", "#openAddPopUp", function() {
        var url = adminBaseUrl + '/' + controllerName + "/save";
        getConfigPopUpContent(url);
    });

    $("body").on("click", ".remove_rec", function(e) {
        e.preventDefault();
        var recId = $(this).data("recId");
        var url = adminBaseUrl + '/' + controllerName + "/remove/" + recId;
        $.ajax({
            type: "GET",
            url: url,
            dataType: "json",
            success: function(response) {
                if (response.status) {
                    successMessage("Record removed successfully!");
                    loadContent();
                }
            }
        });
    });

    $("body").on("click", ".edit_rec", function(e) {
        e.preventDefault();
        var recId = $(this).data("recId");
        var url = adminBaseUrl + '/' + controllerName + "/save/" + recId;
        getConfigPopUpContent(url);
    });
});