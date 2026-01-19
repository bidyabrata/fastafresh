<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">Product Upload</h3>
        <button onclick="closeConfig()" class="btn btn-outline-secondary float-right"><i class="fas fa-times"></i></button>
    </div>

    <form class="" id="productCsvUpoadForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/generateCertificateFromCSV'; ?>" enctype="multipart/form-data">
        <div class="card-body">
            <div class="form-group">
                <label for="file">
                    <input type="file" name="file" id="productCSV" accept=".csv" required>
                </label>
            </div>
        </div>
        <div class="card-footer">
            <button type="submit" id="uploadProductCSV" class="mt-1 btn btn-primary">Submit</button>
        </div>
    </form>
</div>