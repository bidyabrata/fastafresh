<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Product Category</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>
    <form id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save'; ?>" novalidate="novalidate">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Category Name</label>
                <input name="name" id="name" placeholder="Category name" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url Mask</label>
                <input name="url_mask" id="url_mask" placeholder="category-name" type="text" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="parent_id" class="">Parent</label>
                <select name="parent_id" id="parent_id" class="form-control select2" style="width: 100%;">
                    <option value="">Please Select</option>
                    <?php foreach ($categories as $key => $category) { ?>
                        <option value="<?php echo $category['id']; ?>"><?php echo $category['name']; ?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="form-check">
                <input name="show_on_menu" id="show_on_menu" type="checkbox" checked class="form-check-input">
                <label for="show_on_menu" class="form-check-label">Show on Menu</label>
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
                <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
            </div>
            <div class="form-group">
                <label for="content" class="">Description</label>
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