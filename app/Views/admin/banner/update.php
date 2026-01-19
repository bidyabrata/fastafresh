<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Banner</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>
    <form id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save'; ?>" novalidate="novalidate">
        <input type="hidden" id="id" name="id" value="<?php echo $blocks['id']; ?>">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Name</label>
                <input name="name" id="name" placeholder="Banner name" type="text" class="form-control" value ="<?php echo $blocks['name']; ?>" required>
            </div>
            <div class="form-group">
                <label for="url_mask" class="">Url</label>
                <input name="url_mask" id="url_mask" placeholder="Url" type="url" class="form-control" value ="<?php echo $blocks['attached_link']; ?>" required>
            </div>
            <div class="form-group">
                <div class="dropzone" id="myDropZone" name="mainFileUploader">
                    <div class="fallback">
                        <input name="file" type="file" />
                    </div>
                </div>
                <input name="file_name" id="file_name" type="hidden" class="form-control">
                <input name="old_file_name" id="old_file_name" type="hidden" class="form-control" value="<?php echo $blocks['banner']; ?>">
                <small class="form-text text-muted">This is some placeholder block-level help text for the above input. It's a bit lighter and easily wraps to a new line.</small>
            </div>
            <div class="form-check">
                <input name="status" id="status" type="checkbox" checked <?php if ($blocks['status'] == "A") {
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