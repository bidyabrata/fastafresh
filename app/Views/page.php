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
    <div class="pageBody my-4 min-vh">
        <div class="container bgWhite">
            <div class="row">
                <div class="col-12 py-4">
                    <?php if ($pageContent) {
                        echo $pageContent["content"];
                    } ?>
                </div>
            </div>
        </div>
    </div>
    <?php // echo $extendedFooter; ?>
    <?php echo $footer; ?>
    <?php echo $script; ?>
</body>

</html>