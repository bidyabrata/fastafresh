<?php echo $meta; ?>

<body class="hold-transition sidebar-mini">
    <div class="wrapper">
        <?php echo $header; ?>
        <?php echo $navigation; ?>
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <!-- <h1 class="m-0">Products</h1> -->
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <form class="" id="productCsvUpoadForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/generateProductFromCSV'; ?>" enctype="multipart/form-data">
                                <div class="form-group">
                                    <label for="productCSV">
                                        <input type="file" name="productCSV" id="productCSV" accept=".csv" required>
                                    </label>
                                    <button type="submit" id="uploadProductCSV" class="mt-1 btn btn-primary">Submit</button>
                                </div>
                            </form>

                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

            <!-- Main content -->
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0" style="height: 500px;">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Name</th>
                                                <th>Category</th>
                                                <th>Price</th>
                                                <th>Offer Price</th>
                                                <th>Price Unit</th>
                                                <th>Cost of Product</th>
                                                <th>Product Type</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="landing-content">
                                            <?php include("landing-content.php"); ?>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- /.card-body -->
                            </div>
                            <!-- /.card -->
                        </div>
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
        <?php echo $config; ?>
        <!-- /.control-sidebar -->
        <?php echo $footer; ?>
    </div>
    <!-- ./wrapper -->

    <!-- REQUIRED SCRIPTS -->

    <?php echo $script; ?>

    <!-- OPTIONAL SCRIPTS -->
    <script type="text/javascript" src="<?php echo $assetPath; ?>js/pages/product.js"></script>
</body>

</html>