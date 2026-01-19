<!DOCTYPE html>
<html lang="en">

<head>
    <?php echo $meta; ?>
    <?php echo $style; ?>
</head>

<body>
    <header>
        <?php echo $header; ?>
    </header>
    <div class="listBody">
        <div class="container ">
            <div class="row">
                <div class="col-lg-3 mb-2">
                    <div class="catList bgWhite">
                        <div class="catHed">Others Categories</div>
                        <ul class="accordion">
                            <?php foreach ($siblingCategories as $ctKey => $siblingVal) { ?>
                                <li>
                                    <a class="sibling-categories <?php if ($siblingVal['url_mask'] == $categoryDetails['url_mask']) {
                                                                        echo "active";
                                                                    } ?>" href="<?php echo $baseUrl . '/' . $siblingVal['url_mask']; ?>"><?php echo $siblingVal['name']; ?></a>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9 mb-4">
                    <div class="bgWhite">
                        <!-- <nav aria-label="breadcrumb" class="breadcrumbWrp">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Plant By Type</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Air Plants</li>
                            </ol>
                        </nav> -->
                        <h2 class="lstTtl"><?php echo $categoryDetails['name']; ?></h2>
                        <div class="sorting d-none d-md-block">

                            <!-- <span style="cursor: auto;">Sort By</span>
                            <span class="active">Popularity</span>
                            <span>Price-Low to High</span>
                            <span>Price-High to Low</span> -->
                        </div>
                        <div id="list-section" class="Plisting">
                            <?php include("list-product.php"); ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php //echo $extendedFooter; 
    ?>
    <?php echo $footer; ?>
    <?php echo $script; ?>
    <script>
        function loadProd(pageId) {
            if (pageId > 1) {
                var url = window.location.href.split('?')[0] + '?page_no=' + pageId;
            } else {
                url = window.location.href.split('?')[0];
            }

            $.ajax({
                url: url,
                type: 'get',
                success: function(response) {
                    history.pushState(null, "", url);
                    $("#list-section").html(response);
                    $("html, body").animate({
                        scrollTop: 0
                    }, "slow");
                }
            });
        }
    </script>
</body>

</html>