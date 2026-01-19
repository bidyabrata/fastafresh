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
        <section>
            <div class="bnrWrp">
                <?php foreach ($sliders as $key => $slider) { ?>
                    <div class="bannerbx">
                        <img class="banner" src="<?php echo $uploadPath; ?>/home_banner/<?php echo $slider['banner']; ?>" />
                        <!-- <div class="bnrData">
                        <div class="dtamdl">
                            <h1 class="bnrHed">LANDSCAPE DEVELOPMENT</h1>
                            <p>We offer a diverse range of landscaping services to the customers</p>
                            <a href="#">Know more</a>
                        </div>
                    </div> -->
                    </div>
                <?php } ?>
                <!-- <div class="bannerbx">
                    <img class="banner" src="<?php echo $imagePath; ?>/banner/banner1.jpg" />
                    <div class="bnrData">
                        <div class="dtamdl">
                            <h1 class="bnrHed">LANDSCAPE DEVELOPMENT</h1>
                            <p>We offer a diverse range of landscaping services to the customers</p>
                            <a href="#">Know more</a>
                        </div>
                    </div>
                </div> -->
            </div>
        </section>
        <div class="container linktoimageWrp">
            <div class="row">
                <div class="col-12">
                    <div style="padding:0 30px;">

                        <div class="row">
                            <div class="col-12 col-sm-7">
                                <a class="linktoimage" href="#"><img src="<?php echo $imagePath; ?>/homelink/first-banner.jpg" /></a>
                            </div>
                            <div class="col-12 col-sm-5">
                                <a class="linktoimage" href="#"><img src="<?php echo $imagePath; ?>/homelink/second-banner.jpg" /></a>
                                <a class="linktoimage" href="#"><img src="<?php echo $imagePath; ?>/homelink/third-banner.jpg" /></a>
                            </div>
                        </div>

                        <div class="max-960 mx-auto mt-70 mb-70">
                            <a class="linktoimage shadowlg" href="#"><img src="<?php echo $imagePath; ?>/homelink/center-banner.jpg" /></a>
                        </div>

                        <div class="text-center headlineBx py-30">
                            <h2>Let us Help You!</h2>
                            <p>We are known for designing and implementing incredible gardens</p>
                        </div>
                        <div class="row">
                            <?php foreach ($banners as $bKey => $bnr) { ?>
                                <div class="col-12 col-sm-6">
                                    <a class="linktoimage" href="<?php echo $bnr['attached_link']; ?>"><img src="<?php echo $uploadPath; ?>/home_banner/<?php echo $bnr['banner']; ?>" /></a>
                                </div>
                            <?php } ?>
                            <!-- <div class="col-12 col-sm-6">
                                <a class="linktoimage" href="#"><img src="<?php echo $imagePath; ?>/homelink/half2.jpg" /></a>
                            </div> -->
                        </div>

                        <div class="text-center headlineBx mt-70 pb-30">
                            <h2>Shop Plants in Trend</h2>
                            <p>EXCLUSIVE TISSUE CULTURE & IMPORTED PLANTS</p>
                        </div>

                        <div class="row">
                            <div class="col-12 col-sm-4">
                                <a class="linktotrands" href="#">
                                    <img src="<?php echo $imagePath; ?>/homelink/trands1.png" />
                                    <div class="trandsNm">GREEN PLANTS</div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-4">
                                <a class="linktotrands" href="#">
                                    <img src="<?php echo $imagePath; ?>/homelink/trands2.png" />
                                    <div class="trandsNm">COST REDUCTION</div>
                                </a>
                            </div>
                            <div class="col-12 col-sm-4">
                                <a class="linktotrands" href="#">
                                    <img src="<?php echo $imagePath; ?>/homelink/trands3.png" />
                                    <div class="trandsNm">HOUSE PLANTS</div>
                                </a>
                            </div>
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