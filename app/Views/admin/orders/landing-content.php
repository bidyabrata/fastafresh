<?php foreach ($allOrders as $key => $value) { ?>
    <tr>
        <td><?php echo $value['order_ref']; ?></td>
        <td><?php echo $value['product_amount']; ?></td>
        <td><?php echo $value['shipping_amount']; ?></td>
        <td><?php echo $value['service_charge_amount']; ?></td>
        <td><?php echo $value['discount_amount']; ?></td>
        <td><?php echo $value['discount_name']; ?></td>
        <td><?php echo $value['payable_amount']; ?></td>
        <td><?php echo $value['shipping_zipcode']; ?></td>
        <td><?php echo $value['addresses']; ?></td>
        <td><?php echo $value['status']; ?></td>
        <td><?php echo date("dS M,Y g:i a",strtotime($value['createdOn'])); ?></td>
    </tr>
<?php } ?>