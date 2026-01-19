<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">SEO</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>

    <form class="" id="addSEOFrm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/save'; ?>" enctype="multipart/form-data">
        <div class="card-body">      
            <div class="form-group">
                <label for="seoTitle" class="">SEO Title : </label>
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
            <div class="form-check">
                <input name="status" id="status" type="checkbox" checked class="form-check-input">
                <label for="status" class="form-check-label">Publish</label>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="addSEO" class="mt-1 btn btn-primary">Submit</button>
        </div>
    </form>
</div>