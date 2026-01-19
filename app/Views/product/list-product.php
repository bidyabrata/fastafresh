<div class="row px-4 prod-container">
    <?php foreach ($productsInfo['items'] as $key => $value) { ?>
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
                                                    <a class="addToCart" data-id="<?php echo $value['id']; ?>" href="#">ADD To CART</a>
                                                    <a class="buyNow" data-id="<?php echo $value['id']; ?>" href="#">BUY NOW</a>
                                                </div> -->
                </div>
            </div>
        </div>
    <?php } ?>
</div>

<div class="d-flex justify-content-around" style="padding-bottom: 5px;">
    <button type="button" onclick="loadProd(<?php echo $productsInfo['currentPage'] - 1; ?>)" <?php if (($productsInfo['currentPage'] < 2) || ($productsInfo['totalPage'] == 1)) {
                                                                                                    echo "disabled";
                                                                                                } ?> class="btn btn-light">
        < Previous</button> <span style="margin-top: 5px;">Showing page <b id="currentPage"><?php echo $productsInfo['currentPage']; ?></b> of <b id="totalPage"><?php echo $productsInfo['totalPage']; ?></b></span> <button <?php if (($productsInfo['currentPage'] == $productsInfo['totalPage']) || ($productsInfo['totalPage'] == 1)) {
                                                                                                                                                                                                                                    echo "disabled";
                                                                                                                                                                                                                                } ?> onclick="loadProd(<?php echo $productsInfo['currentPage'] + 1; ?>)" type="button" class="btn btn-light">Next ></button>
</div>