<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Product</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>

    <form class="" id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save/' . $product['id']; ?>" enctype="multipart/form-data">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Name</label>
                <input name="name" id="name" placeholder="Name" type="text" class="form-control" value="<?php echo $product['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url Mask</label>
                <input name="url_mask" id="url_mask" placeholder="Url Mask" type="text" class="form-control" value="<?php echo $product['url_mask']; ?>" required>
            </div>
            <div class="form-group">
                <label for="sku" class="">SKU</label>
                <input name="sku" id="sku" placeholder="Category name" type="text" class="form-control" value="<?php echo $product['sku']; ?>" required>
            </div>
            <div class="form-group">
                <label for="product_type" class="">Product Type</label>
                <select name="product_type" id="product_type" required class="form-control select2" required>
                    <option value="">Please Select</option>
                    <option value="standard" <?php if ($product['product_type'] == 'standard') echo "selected"; ?>>Standard</option>
                    <option value="combination" <?php if ($product['product_type'] == 'combination') echo "selected"; ?>>Combination</option>
                    <option value="package" <?php if ($product['product_type'] == 'package') echo "selected"; ?>>Package</option>
                </select>
            </div>
            <div class="form-group">
                <label for="combinations" class="">Combinations( Select for Product Type Combination)</label>
                <select class="form-control multi-select2" id="combinations" name="combinations[]" multiple="multiple">
                    <option value="">Please Select</option>
                    <?php foreach ($combinationProducts as $key => $variant) { ?>
                        <option value="<?php echo $variant['id']; ?>" <?php if (in_array($variant['id'], $product['combinations'] ? explode(",", $product['combinations']) : [])) {
                                                                            echo "selected";
                                                                        } ?>><?php echo $variant['name'];  ?></option>
                    <?php } ?>
                </select>
            </div>

            <div class="form-group">
                <label for="default_category" class="">Default category</label>
                <select name="default_category" id="default_category" required class="form-control select2">
                    <option value="">Please Select</option>
                    <?php foreach ($getCategory as $key => $category) { ?>
                        <?php if ($category['id'] == $product['id_default_category']) { ?>
                            <option value="<?php echo $category['id']; ?>" selected><?php echo $category['name'];  ?></option>
                        <?php } else { ?>
                            <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                    <?php }
                    } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="other_categories" class="">Other categories</label>
                <select class="form-control multi-select2" id="other_categories" name="other_categories[]" multiple="multiple" required>
                    <option value="">Please Select</option>
                    <?php foreach ($getCategory as $key => $category) { ?>
                        <option value="<?php echo $category['id']; ?>" <?php if (in_array($category['id'], $otherCategories)) {
                                                                            echo "selected";
                                                                        } ?>><?php echo $category['name'];  ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="brand" class="">Brand</label>
                <select name="brand" id="brand" class="form-control select2">
                    <option value="">Please Select</option>
                    <?php foreach ($brands as $key => $brand) { ?>
                        <option value="<?php echo $brand['id']; ?>" <?php if ($product['id_brand'] == $brand['id']) echo "selected"; ?>><?php echo $brand['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="price" class="">Price</label>
                <input name="price" id="price" placeholder="Price" type="text" class="form-control" value="<?php echo $product['price']; ?>" required>
            </div>
            <div class="form-group">
                <label for="offer_price" class="">Offer Price</label>
                <input name="offer_price" id="offer_price" placeholder="OfferPrice" type="text" class="form-control" value="<?php echo $product['offer_price']; ?>">
            </div>
            <div class="form-group">
                <label for="price_unit" class="">Price Unit</label>
                <input name="price_unit" id="price_unit" placeholder="Price Unit" type="text" class="form-control" required value="<?php echo $product['price_unit']; ?>">
            </div>
            <div class="form-group">
                <label for="cost_of_product" class="">Cost of Product</label>
                <input name="cost_of_product" id="cost_of_product" placeholder="Cost of Product" type="text" class="form-control" value="<?php echo $product['cost_of_product']; ?>">
            </div>
            <div class="form-group">
                <input type="hidden" id="inventory_id" name="inventory_id" value="<?php if (isset($inventoryInfo['id'])) {
                                                                                        echo $inventoryInfo['id'];
                                                                                    } ?>">
                <label for="quantity" class="">Current Inventory</label>
                <input name="quantity" id="quantity" placeholder="Inventory" type="number" class="form-control" readonly required value="<?php if (isset($inventoryInfo['quantity'])) {
                                                                                                                                                echo $inventoryInfo['quantity'];
                                                                                                                                            } ?>">

            </div>
            <div class="form-group">
                <label for="min_quantity_to_sale" class="">Min Quantity to Sell</label>
                <input name="min_quantity_to_sale" id="min_quantity_to_sale" placeholder="Min Quantity to Sell" type="number" class="form-control" required value="<?php if (isset($inventoryInfo['min_quantity_to_sale'])) {
                                                                                                                                                                        echo $inventoryInfo['min_quantity_to_sale'];
                                                                                                                                                                    } ?>">
            </div>
            <div class="form-group">
                <label for="max_quantity_to_sale" class="">Max Quantity to Sell</label>
                <input name="max_quantity_to_sale" id="max_quantity_to_sale" placeholder="Max Quantity to Sell" type="number" class="form-control" required value="<?php if (isset($inventoryInfo['max_quantity_to_sale'])) {
                                                                                                                                                                        echo $inventoryInfo['max_quantity_to_sale'];
                                                                                                                                                                    } ?>">
            </div>
            <div class="form-group">
                <label for="low_stock_lavel" class="">Low Stock Level</label>
                <input name="low_stock_lavel" id="low_stock_lavel" placeholder="Low Stock Level" type="number" class="form-control" required value="<?php if (isset($inventoryInfo['low_stock_lavel'])) {
                                                                                                                                                        echo $inventoryInfo['low_stock_lavel'];
                                                                                                                                                    } ?>">
            </div>

            <div class="form-group">
                <input type="hidden" id="seoid" name="seoid" value="<?php if (!empty($seo)) {
                                                                        echo $seo['id'];
                                                                    } ?>">
                <label for="seoTitle" class="">SEO Title</label>
                <input name="seoTitle" id="seoTitle" placeholder="SEO Title" type="text" value="<?php if (!empty($seo)) {
                                                                                                    echo $seo['title'];
                                                                                                } ?>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seoKey" class="">SEO Keywords</label>
                <input name="seoKey" id="seoKey" placeholder="SEO Keywords" type="text" value="<?php if (!empty($seo)) {
                                                                                                    echo $seo['keywords'];
                                                                                                } ?>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seoDes" class="">SEO Description</label>
                <textarea name="seoDes" id="seoDes" class="form-control" required><?php if (!empty($seo)) {
                                                                                        echo $seo['description'];
                                                                                    } ?></textarea>
            </div>
            <div class="form-group">
                <div class="dropzone" id="myDropZone" name="mainFileUploader">
                    <div class="fallback">
                        <input name="file" type="file" />
                    </div>
                </div>
                <input name="file_name" id="file_name" type="hidden" class="form-control">
                <input name="old_file_names" id="old_file_names" type="hidden" class="form-control" value="<?php echo $product['default_image']; ?>">
                <small class="form-text text-muted">Default Image (Upload one only)</small>
            </div>

            <div class="form-group">
                <div class="dropzone" id="myDropZone2" name="mainFileUploader">
                    <div class="fallback">
                        <input name="file" type="file" />
                    </div>
                </div>
                <div id="other_image_container_div">
                    <?php foreach ($otherImages as $key => $images) { ?>
                        <input type='hidden' class="other_images_multi" name='other_images[]' id='other_image_<?php echo $images['image_name']; ?>' value="<?php echo $images['image_name']; ?>" />
                    <?php } ?>
                </div>
                <small class="form-text text-muted">Other Images</small>
            </div>
            <div class="form-group">
                <label for="content" class="">Short Text</label>
                <textarea name="srtext" id="srtext" class="form-control"><?php echo $product['short_desc']; ?></textarea>
            </div>
            <div class="form-group">
                <label for="content" class="">Content</label>
                <textarea name="content" id="content" class="form-control"><?php echo html_entity_decode($product['description']); ?></textarea>
            </div>
            <div class="form-check">
                <input name="status" id="status" type="checkbox" checked <?php if ($product['status'] == "A") {
                                                                                echo "checked";
                                                                            } ?>class="form-check-input">
                <label for="status" class="form-check-label">Publish</label>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="addWithDropzone" class="mt-1 btn btn-primary">Submit</button>
        </div>
    </form>
</div>