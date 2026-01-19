<?php foreach ($allProducts as $key => $value) { ?>
    <tr>
        <td><?php echo $value['name'] . "(" . $value['id'] . ")"; ?></td>
        <td><?php echo $value['cat_name'] . "(" . $value['id_default_category'] . ")"; ?></td>
        <td><?php echo $value['price']; ?></td>
        <td><?php echo $value['offer_price']; ?></td>
        <td><?php echo $value['price_unit']; ?></td>
        <td><?php echo $value['cost_of_product']; ?></td>
        <td><?php echo $value['product_type']; ?></td>
        <td><button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-warning edit_rec"><i class="fas fa-edit"></i>
            </button>
            <button data-rec-id="<?php echo $value['id']; ?>" class="mb-2 mr-2 btn btn-danger remove_rec"><i class="fas fa-trash-alt"></i>
            </button>
        </td>
    </tr>
<?php } ?>