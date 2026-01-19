<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Product</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>

    <form class="" id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save'; ?>" enctype="multipart/form-data">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Name</label>
                <input name="name" id="name" placeholder="Name" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url Mask</label>
                <input name="url_mask" id="url_mask" placeholder="Url" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="sku" class="">SKU</label>
                <input name="sku" id="sku" placeholder="ABC100" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="product_type" class="">Product Type</label>
                <select name="product_type" id="product_type" required class="form-control select2" required>
                    <option value="">Please Select</option>
                    <option value="standard">Standard</option>
                    <option value="combination">Combination</option>
                    <option value="package">Package</option>
                </select>
            </div>
            <div class="form-group">
                <label for="default_category" class="">Default category</label>
                <select name="default_category" id="default_category" required class="form-control select2" required>
                    <option value="">Please Select</option>
                    <?php foreach ($getCategory as $key => $category) { ?>
                        <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                </select>
            </div>

            <div class="form-group">
                <label for="other_categories" class="">Other categories</label>
                <select class="form-control multi-select2" id="other_categories" name="other_categories[]" multiple="multiple" required>
                    <!-- <option value="">Please Select</option> -->
                    <?php foreach ($getCategory as $key => $category) { ?>
                        <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="brand" class="">Brand</label>
                <select name="brand" id="brand" class="form-control select2">
                    <option value="">Please Select</option>
                    <?php foreach ($brands as $key => $brand) { ?>
                        <option value="<?php echo $brand['id']; ?>"><?php echo $brand['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-group">
                <label for="price" class="">Price</label>
                <input name="price" id="price" placeholder="Price" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="offer_price" class="">Offer Price</label>
                <input name="offer_price" id="offer_price" placeholder="OfferPrice" type="text" class="form-control">
            </div>
            <div class="form-group">
                <label for="price_unit" class="">Price Unit</label>
                <input name="price_unit" id="price_unit" placeholder="Price Unit" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="cost_of_product" class="">Cost of Product</label>
                <input name="cost_of_product" id="cost_of_product" placeholder="Cost of Product" type="text" class="form-control">
            </div>
            <div class="form-group">
                <label for="quantity" class="">Current Inventory</label>
                <input name="quantity" id="quantity" placeholder="Inventory" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="min_quantity_to_sale" class="">Min Quantity to Sell</label>
                <input name="min_quantity_to_sale" id="min_quantity_to_sale" placeholder="Min Quantity to Sell" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="max_quantity_to_sale" class="">Max Quantity to Sell</label>
                <input name="max_quantity_to_sale" id="max_quantity_to_sale" placeholder="Max Quantity to Sell" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="low_stock_lavel" class="">Low Stock Level</label>
                <input name="low_stock_lavel" id="low_stock_lavel" placeholder="Low Stock Level" type="number" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seoTitle" class="">SEO Title</label>
                <input name="seoTitle" id="seoTitle" placeholder="SEO Title" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seoKey" class="">SEO Keywords</label>
                <input name="seoKey" id="seoKey" placeholder="SEO Keywords" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seoDes" class="">SEO Description</label>
                <textarea name="seoDes" id="seoDes" class="form-control" required></textarea>
            </div>
            <div class="form-group">
                <div class="dropzone" id="myDropZone" name="mainFileUploader">
                    <div class="fallback">
                        <input name="file" type="file" />
                    </div>
                </div>
                <input name="file_name" id="file_name" type="hidden" class="form-control">
                <small class="form-text text-muted">Default Image (Upload one only)</small>
            </div>
            <div class="form-group">
                <div class="dropzone" id="myDropZone2" name="mainFileUploader">
                    <div class="fallback">
                        <input name="file" type="file" />
                    </div>
                </div>
                <div id="other_image_container_div">

                </div>
                <!-- <input name="other_images[]" id="other_images" type="hidden" class="form-control"> -->
                <small class="form-text text-muted">Other Image</small>
            </div>



            <!-- <div class="form-group">
            <div class="dropzone" id="myDropZone" name="mainFileUploader">
                <div class="fallback">
                    <input name="file" type="file" />
                </div>
            </div>
            <input name="file_name[]" id="file_name" type="text" class="form-control">
            <small class="form-text text-muted">Images</small>
        </div> -->
            <div class="form-group">
                <label for="content" class="">Short Text</label>
                <textarea name="srtext" id="srtext" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label for="content" class="">Content</label>
                <textarea name="content" id="content" class="form-control"></textarea>
            </div>
            <div class="form-check">
                <input name="status" id="status" type="checkbox" checked class="form-check-input">
                <label for="status" class="form-check-label">Publish</label>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="addWithDropzone" class="mt-1 btn btn-primary">Submit</button>
        </div>
    </form>
</div>