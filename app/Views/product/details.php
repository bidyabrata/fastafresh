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
    <div class="detailsBody">
        <div class="container bgWhite">
            <div class="row">
                <div class="col-12 col-md-5">
                    <div class="dtlImgBx">
                        <img src="<?php echo $uploadPath . 'product/' . $item['default_image']; ?>" />
                        <div class="btnGrp">
                            <!-- <a class="addToCart" href="#">ADD To CART</a>
                            <a class="buyNow" href="#">BUY NOW</a> -->
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-7">
                    <div class="detailsBx">
                        <!-- <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Plants
                                        by Type</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Air Plants</li>
                            </ol>
                        </nav> -->
                        <h1 class="pName"><?php echo $item['name']; ?></h1>
                        <div class="psortD">
                            <?php echo $item['short_desc']; ?>
                        </div>
                        <div class="pTagWrp">
                            <span class="mnPrice">Rs. <?php if ($item['ofr_name']) {
                                                            if ($item['reduction_type'] === 'Flat') {
                                                                echo round($item['price'] - $item['reduction']);
                                                            } else {
                                                                echo round($item['price'] - (($item['price'] * $item['reduction']) / 100));
                                                            }
                                                        } else {
                                                            echo $item['price'];
                                                        } ?></span>
                            <?php if ($item['ofr_name']) { ?>
                                <span class="oldPrice">Rs.<?php echo $item['price']; ?></span>
                                <span class="offrate"><?php echo $item['ofr_name']; ?></span>
                            <?php } ?>
                            <span class="instock">In Stock</span>
                            <!--<span class="outstock">Out of Stock</span>-->
                        </div>
                        <!-- <div class="avalchk">
                            <input type="text" placeholder="Pincode">
                            <button>Check availabality</button>
                            <div class="avlmsg">Product is available in your
                                area.</div>
                        </div> -->

                        <div class="detailswrp">
                            <h2>Details</h2>
                            <div class="detailsDta">
                                <?php echo $item['description']; ?>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <h2 class="lstTtl">Check our other products</h2>
            <div class="row px-4">
                <?php foreach ($reletedproducts['items'] as $key => $value) { ?>
                    <div class="col-sm-6 col-md-4">
                        <div class="pWrap">
                            <div class="pImg">
                                <a href="<?php echo $baseUrl . '/' . $categoryDetails['url_mask'] . '/' .  $value['url_mask']; ?>">
                                    <img src="<?php echo $uploadPath . 'product/' . $value['default_image']; ?>" />
                                </a>
                            </div>
                            <div class="plstDta">
                                <div class="plNm">
                                    <a href="<?php echo $baseUrl . '/' . $categoryDetails['url_mask'] . '/' .  $value['url_mask']; ?>">
                                        <?php echo $value['name']; ?>
                                    </a>
                                </div>
                                <div class="pTagWrp">
                                    <span class="mnPrice">Rs. <?php if ($value['ofr_name']) {
                                                                    if ($value['reduction_type'] === 'Flat') {
                                                                        echo round($value['price'] - $value['reduction']);
                                                                    } else {
                                                                        echo round($value['price'] - (($value['price'] * $value['reduction']) / 100));
                                                                    }
                                                                } else {
                                                                    echo $value['price'];
                                                                } ?></span>
                                    <?php if ($value['ofr_name']) { ?>
                                        <span class="oldPrice">Rs.<?php echo $value['price']; ?></span>
                                        <span class="offrate"><?php echo $value['ofr_name']; ?></span>
                                    <?php } ?>
                                </div>
                                <!-- <div class="btnGrp">
                                    <a class="addToCart" data-id="<?php// echo $value['id']; ?>" href="#">ADD To CART</a>
                                    <a class="buyNow" data-id="<?php //echo $value['id']; ?>" href="#">BUY NOW</a>
                                </div> -->
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
    </div>
    <?php //echo $extendedFooter; 
    ?>
    <?php echo $footer; ?>
    <?php echo $script; ?>
</body>

</html>