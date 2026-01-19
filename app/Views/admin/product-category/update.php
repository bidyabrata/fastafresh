<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Product Category</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>
    <form class="" id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save/' . $category['id']; ?>">
        <input type="hidden" id="seoid" name="seoid" value="<?php if (!empty($seo)) {
                                                                echo $seo['id'];
                                                            } ?>">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Category Name</label>
                <input name="name" id="name" placeholder="Category name" type="text" class="form-control" value="<?php echo $category['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url Mask</label>
                <input name="url_mask" id="url_mask" placeholder="category-name" type="text" class="form-control" value="<?php echo $category['url_mask']; ?>" required>
            </div>
            <div class="form-group">
                <label for="parent_id" class="">Parent</label>
                <select name="parent_id" id="parent_id" class="form-control select2">
                    <option value="">Please Select</option>
                    <?php foreach ($categories as $key => $cat) { ?>
                        <option <?php if ($category['id_parent'] == $cat['id']) {
                                    echo "selected";
                                } ?> value="<?php echo $cat['id']; ?>"><?php echo $cat['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-check">
                <input name="show_on_menu" id="show_on_menu" type="checkbox" <?php if ($category['show_on_menu'] == "Yes") {
                                                                                    echo "checked";
                                                                                } ?> class="form-check-input">
                <label for="show_on_menu" class="form-check-label">Show on Menu</label>
            </div>
            <div class="form-group">
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
                <input name="old_file_name" id="old_file_name" type="hidden" class="form-control" value="<?php echo $category['default_image']; ?>">
                <!-- <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small> -->
            </div>
            <div class="form-group">
                <label for="content" class="">Description</label>
                <textarea name="content" id="content" class="form-control"><?php echo $category['content']; ?></textarea>
            </div>
            <div class="form-check">
                <input name="status" id="status" type="checkbox" <?php if ($category['status'] == "A") {
                                                                        echo "checked";
                                                                    } ?> class="form-check-input">
                <label for="status" class="form-check-label">Publish</label>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="addWithDropzone" class="mt-1 btn btn-primary">Submit</button>
        </div>
    </form>
</div>