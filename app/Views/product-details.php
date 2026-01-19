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
    <div class="HomeBody">
        <div class="container linktoimageWrp">
            <div class="row">
                <div class="col-12">
                    <div style="padding:0 30px;">
                        <div class="row">
                            <?php if ($productDetails) {
                                foreach ($productDetails as $key => $val) {
                            ?>
                                    <div class="col-12 col-sm-4">
                                        <a class="linktotrands" href="#">
                                            <img src="<?php echo $product; ?><?php echo $val['default_image']; ?>" />
                                            <div class="trandsNm"><?php echo $val['name']; ?></div>
                                        </a>
                                    </div>
                            <?php }
                            } ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php echo $extendedFooter; ?>
    <?php echo $footer; ?>
    <?php echo $script; ?>
</body>

</html>