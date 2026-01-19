<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Page</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>
    <form id="addWithDropZoneForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save'; ?>" novalidate="novalidate">
    <input type="hidden" id="id" name="id" value="<?php echo $blocks['id']; ?>">
        <div class="card-body">
            <div class="form-group">
                <label for="name" class="">Name</label>
                <input name="name" id="name" placeholder="Name" type="text" class="form-control" value="<?php echo $blocks['name']; ?>" required>
            </div>
            <div class="form-check">
                <input name="is_removeable" id="is_removeable" type="checkbox" checked <?php if ($blocks['is_removeable'] == "Yes") {
                                                                                    echo "checked";
                                                                                } ?> class="form-check-input">
                <label for="is_removeable" class="form-check-label">Is Removeable</label>
            </div>
            <div class="form-group">
                <label for="content" class="">Description</label>
                <textarea name="content" id="content" class="form-control"><?php echo $blocks['content']; ?></textarea>
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