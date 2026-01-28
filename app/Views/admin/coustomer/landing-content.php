<?php foreach ($allCustomers as $key => $value) { ?>
    <tr>
        <td><?php echo $value['fname'] . ' ' . $value['lname']; ?></td>
        <td><?php echo $value['email_address']; ?></td>
        <td><?php echo $value['phone']; ?></td>
        <td><?php echo $value['address_line_1'] . "," . $value['address_line_2'] . "," . $value['city'] . "," . $value['zip_code']; ?></td>
        <td><?php echo $value['status']; ?></td>
        <td><?php echo date("dS M,Y g:i a", strtotime($value['createdOn'])); ?></td>
        <td><a href="<?php echo $adminBaseUrl . '/'  . 'orders/' . $value['id']; ?>" class="mb-2 mr-2 btn btn-warning"><i class="fas fa-eye"></i></a>
        <?php } ?>