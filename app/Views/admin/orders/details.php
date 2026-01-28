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
                        <div class="col-12" style="display: flex;">
                            <div class="col-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong><?php echo $order['order_ref']; ?></strong></h5>
                                        <p class="card-text"><strong>Order Status: </strong><?php echo $order['order_status']; ?></p>
                                        <p class="card-text"><strong>Order Time: </strong><br /><?php echo date("dS M,Y g:i a", strtotime($order['createdOn'])); ?></p>
                                        <p class="card-text"><strong>Amount: </strong><?php echo $order['payable_amount'] . "(" . $order['payment_method'] . ")"; ?> <br /><strong>Shipping Fee: </strong><?php echo $order['shipping_amount']; ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong>Shipping Address</strong></h5>
                                        <p class="card-text"><?php echo $order['addresses']['shipping']['name']; ?></p>
                                        <p class="card-text"><?php echo $order['addresses']['shipping']['phone']; ?>/<?php echo $order['addresses']['shipping']['alt_phone']; ?></p>
                                        <p class="card-text"><?php echo $order['addresses']['shipping']['address_line_1'] . ', ' . $order['addresses']['shipping']['address_line_2'] . ', ' . $order['addresses']['shipping']['city'] . ', ' . $order['addresses']['shipping']['zip_code']; ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong>Customer Details</strong></h5>
                                        <p class="card-text"><?php echo $customerDetails['fname'] . ' ' . $customerDetails['lname']; ?></p>
                                        <p class="card-text"><?php echo $customerDetails['email_address'] . ' ' . $customerDetails['phone']; ?></p>
                                        <p class="card-text"><?php echo $customerDetails['address_line_1'] . ', ' . $customerDetails['address_line_2']; ?></p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="card">
                                    <div class="card-body">
                                        <h5 class="card-title"><strong>Billing Address</strong></h5>
                                        <p class="card-text"><?php echo $order['addresses']['billing']['name']; ?></p>
                                        <p class="card-text"><?php echo $order['addresses']['billing']['phone']; ?>/<?php echo $order['addresses']['billing']['alt_phone']; ?></p>
                                        <p class="card-text"><?php echo $order['addresses']['billing']['address_line_1'] . ', ' . $order['addresses']['billing']['address_line_2'] . ', ' . $order['addresses']['billing']['city'] . ', ' . $order['addresses']['billing']['zip_code']; ?></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="card">
                                <!-- /.card-header -->
                                <div class="card-body table-responsive p-0">
                                    <table class="table table-head-fixed text-nowrap">
                                        <thead>
                                            <tr>
                                                <th>Product Name</th>
                                                <th>Product Image</th>
                                                <th>Price Unit</th>
                                                <th>Quantity</th>
                                                <th>Amount</th>

                                            </tr>
                                        </thead>
                                        <tbody id="landing-content">
                                            <?php foreach ($order['items'] as $key => $value) { ?>
                                                <tr>
                                                    <td><?php echo $value['name'] . "(" . $value['id_product'] . ")"; ?></td>
                                                    <td><img src="<?php echo $uploadPath . 'product/' . $value['default_image']; ?>" width="50px"></td>
                                                    <td><?php echo $value['price_unit']; ?></td>
                                                    <td><?php echo $value['quantity']; ?></td>
                                                    <td><?php echo $value['applicable_price']; ?></td>

                                                </tr>
                                            <?php } ?>
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
    <script type="text/javascript" src="<?php echo $assetPath; ?>js/pages/orders.js"></script>
    <!-- OPTIONAL SCRIPTS -->
    <script type="text/javascript">
        jQuery(function() {
            $("#openAddPopUp").hide();
        })
    </script>
</body>

</html>