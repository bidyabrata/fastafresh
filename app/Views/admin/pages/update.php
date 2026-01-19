<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Page</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>
    <form id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save/' . $pages['id']; ?>" novalidate="novalidate">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Name</label>
                <input name="name" id="name" placeholder="Name" type="text" class="form-control" value="<?php echo $pages['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url Mask</label>
                <input name="url_mask" id="url_mask" placeholder="url-mask" type="text" class="form-control" value="<?php echo $pages['url_mask']; ?>" required>
            </div>
            <div class="form-group">
                <input type="hidden" id="seo_id" name="seo_id" value="<?php if (!empty($seo)) {
                                                                            echo $seo['id'];
                                                                        } ?>">
                <label for="seo_title" class="">SEO Title</label>
                <input name="seo_title" id="seo_title" placeholder="SEO Title" type="text" value="<?php if (!empty($seo)) {
                                                                                                        echo $seo['title'];
                                                                                                    } ?>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seo_keywords" class="">SEO Keywords</label>
                <input name="seo_keywords" id="seo_keywords" placeholder="SEO Keywords" type="text" value="<?php if (!empty($seo)) {
                                                                                                                echo $seo['keywords'];
                                                                                                            } ?>" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="seo_description" class="">SEO Description</label>
                <textarea name="seo_description" id="seo_description" class="form-control" required><?php if (!empty($seo)) {
                                                                                                        echo $seo['description'];
                                                                                                    } ?></textarea>
            </div>
            <div class="form-check">
                <input name="headfoot" id="headfoot" type="checkbox" checked <?php if ($pages['inc_header_footer'] == "Yes") {
                                                                                    echo "checked";
                                                                                } ?> class="form-check-input">
                <label for="headfoot" class="form-check-label">Include Header & Footer</label>
            </div>
            <div class="form-group">
                <label for="content" class="">Description</label>
                <textarea name="content" id="content" class="form-control"><?php echo stripslashes(html_entity_decode($pages['content'])); ?></textarea>
            </div>
            <div class="form-check">
                <input name="status" id="status" type="checkbox" checked <?php if ($pages['status'] == "A") {
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