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
                            <!-- <h1 class="m-0">Orders</h1> -->
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <!-- <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item active">Dashboard v3</li>
                            </ol> -->
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
                                                <th>Type</th>
                                                <th>Title</th>
                                                <th>Keywords</th>
                                                <th>description</th>
                                                <th>action</th>
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
    <script type="text/javascript" src="<?php echo $assetPath; ?>js/pages/seo.js"></script>
    <!-- OPTIONAL SCRIPTS -->
    <script type="text/javascript">
    jQuery(function() {
        $("#openAddPopUp").hide();
    })
    </script>
</body>

</html>