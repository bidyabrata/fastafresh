<?php foreach ($allOrders as $key => $value) { ?>
    <tr>
        <td><?php echo $value['order_ref']; ?></td>
        <td><?php echo $value['order_status']; ?></td>
        <td><?php echo date("dS M,Y g:i a", strtotime($value['createdOn'])); ?></td>
        <td><?php echo $value['payable_amount']; ?></td>
        <td><?php echo $value['product_amount']; ?></td>
        <td><?php echo $value['shipping_amount']; ?></td>
        <!-- <td><?php //echo $value['service_charge_amount']; 
                    ?></td>
        <td><?php //echo $value['discount_amount']; 
            ?></td>
        <td><?php //echo $value['discount_name']; 
            ?></td> -->

        <td><?php echo $value['shipping_zipcode']; ?></td>
        <!-- <td><?php //echo $value['addresses']; 
                    ?></td> -->


        <td><a href="<?php echo $adminBaseUrl . '/' . $controllerName . '/details/' . $value['id']; ?>" class="mb-2 mr-2 btn btn-warning"><i class="fas fa-eye"></i></a>
    </tr>
<?php } ?>