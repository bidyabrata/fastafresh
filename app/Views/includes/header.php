<section class="topHed">
    <div class="container">
        <div class="row">
            <div class="col-5 d-none d-md-block">
                <div class="hdrConWrp">
                    <div class="hdrCon mr-4"><img src="<?php echo $imagePath;
                                                        ?>/site/call.png" /> +91 94340 73488</div>
                    <div class="hdrCon"><img src="<?php echo $imagePath;
                                                    ?>/site/mail.png" />info@fastafresh.com</div>
                </div>
            </div>
            <div class="col-12 col-md-7 text-right">
                <div class="hrdUsrHlpWrp">
                    <div class="hrdUsrHlp">
                        <form class="hdrSrch">
                            <input type="search" placeholder="search">
                            <button type="submit"></button>
                        </form>
                    </div>
                    <div class="hrdUsrHlp">
                        <a class="cartLink" href="<?php echo $baseUrl . '/cart';
                                                    ?>"><img src="<?php echo $imagePath; ?>/site/cart.png" /><span>0</span></a>
                    </div>
                    <div class="hrdUsrHlp">
                        <a class="dropdown-item popup-modal" href="#login">Login</a>
                        <div class="dropdown myAcc">
                            <button class="nrmlBtn dropdown-toggle"
                                type="button"
                                id="dropdownMenuButton"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false">
                                My Account
                            </button>
                            <div class="dropdown-menu
                                            dropdown-menu-right"
                                aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another
                                    action</a>
                                <a class="dropdown-item" href="#">Something
                                    else here</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <div class="headerWrap">
                <div class="menuWrap">
                    <div id='cssmenu'>
                        <ul>
                            <li class='active'><a href='<?php echo $baseUrl; ?>'>Home</a></li>
                            <?php foreach ($productCategoriesOnMenu as $key => $category) { ?>
                                <?php if ($category['child-categories']) { ?>
                                    <li class='has-submenu'><a href="<?php if ($category['url_mask'] != '#') {
                                                                            echo $baseUrl . '/' . $category['url_mask'];
                                                                        } else {
                                                                            echo "#";
                                                                        } ?>"><?php echo $category['name']; ?></a>
                                        <ul>
                                            <?php foreach ($category['child-categories'] as $k => $childCategory) { ?>
                                                <li><a href='<?php if ($childCategory['url_mask'] != '#') {
                                                                    echo $baseUrl . '/' . $childCategory['url_mask'];
                                                                } else {
                                                                    echo "#";
                                                                } ?>'><?php echo $childCategory['name']; ?></a></li>
                                            <?php } ?>
                                        </ul>
                                    </li>
                                <?php } else { ?>
                                    <li class=''><a href='<?php if ($category['url_mask'] != '#') {
                                                                echo $baseUrl . '/' . $category['url_mask'];
                                                            } else {
                                                                echo "#";
                                                            } ?>'><?php echo $category['name']; ?></a></li>
                                <?php } ?>
                            <?php } ?>


                            <!-- <li class='megamenu'><a href='courses.html'>Decor</a></li>
                            <li><a href='#'>Aids</a></li>
                            <li><a href='#'>Gifts</a></li>
                            <li><a href='#'>Landscaping</a></li> -->
                            <li><a class="menuBtn login" href='#'>Get In Touch</a></li>
                        </ul>
                    </div>
                </div>

                <div class="logoWrap">
                    <a href="<?php echo $baseUrl; ?>">
                        <img src="<?php echo $imagePath; ?>/site/logo.jpeg" alt="logo">
                    </a>
                </div>
                <a href="tel:+919876543210" class="telCon">
                    <img src="<?php echo $imagePath; ?>/site/phone.svg" alt="">
                </a>
            </div>
        </div>
    </div>
</div>