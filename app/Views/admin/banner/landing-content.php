<?php foreach ($allBanner as $key => $value) { ?>
    <tr>
    <?php if($value['attached_link']) {?> 
        <td><a href="<?php echo $value['attached_link']; ?>" target="_blank"><?php echo $value['name']; ?></a></td>
        <?php if(!empty($value['banner'])) {?>
            <td><img src="<?php echo $uploadPath; ?>home_banner/<?php echo $value['banner']; ?>" style="width:100px;"/> </td>
        <?php }else{ ?>
            <td>NA</td>
        <?php } ?>
        <td><?php echo $value['attached_link']; ?></td>
        <td><button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-warning edit_rec"><i class="fas fa-edit"></i>
            </button>
            <button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-danger remove_rec"><i class="fas fa-trash-alt"></i>
            </button></td>
    <?php } ?>
    </tr>
<?php } ?>