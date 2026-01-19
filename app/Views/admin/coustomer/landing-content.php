<?php foreach ($allUsers as $key => $value) { ?>
    <tr>
        <td><?php echo $value['fname'] . ' ' . $value['lname']; ?></td>
        <td><?php echo $value['email_address']; ?></td>
        <td><?php echo $value['phone']; ?></td>
        <td><?php echo $value['status']; ?></td>
        <td><?php echo date("dS M,Y g:i a",strtotime($value['createdOn'])); ?></td>
<?php } ?>