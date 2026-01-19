<?php foreach ($allSeo as $key => $value) { ?>
    <tr>
        <td><?php echo $value['type']; ?></td>
        <td><?php echo $value['title']; ?></td>
        <td><?php echo $value['keywords']; ?></td>
        <td><?php echo $value['description']; ?></td>
        <td><button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-warning edit_rec"><i class="fas fa-edit"></i></button>
            <!-- <button data-rec-id="<?php //echo $value['id']; ?>" class="mb-2 mr-2 btn btn-danger remove_rec"><i class="fas fa-trash-alt"></i></button> -->
        </td>
    </tr>
<?php } ?>