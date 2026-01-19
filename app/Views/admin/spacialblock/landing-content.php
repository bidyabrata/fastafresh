<?php foreach ($allBlocks as $key => $value) { ?>
    <tr>
        <td><?php echo $value['name']; ?></td>
        <td><?php echo $value['content']; ?></td>
        <td><?php echo $value['is_removeable']; ?></td>
        <td><?php echo $value['status']; ?></td>
        <td><?php echo $value['createdOn']; ?></td>
        <td><button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-warning edit_rec"><i class="fas fa-edit"></i>
            </button>
            <button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-danger remove_rec"><i class="fas fa-trash-alt"></i>
            </button></td>
    </tr>
<?php } ?>