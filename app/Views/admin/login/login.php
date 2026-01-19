<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Fasta Fresh | Admin Panel</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="<?php echo $pluginPath; ?>fontawesome-free/css/all.min.css">
    <!-- IonIcons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<?php echo $assetPath; ?>css/adminlte.min.css">
    <link href="<?php echo $pluginPath; ?>dropzone-5.7.0/dist/min/dropzone.min.css" rel="stylesheet">
    <link href="<?php echo $pluginPath; ?>select2-4.0.13/dist/css/select2.min.css" rel="stylesheet">
    <link href="<?php echo $assetPath; ?>css/style.css" rel="stylesheet">
    <script>
        var baseUrl = "<?php echo $baseUrl; ?>";
        var controllerName = "<?php echo $controllerName; ?>";
        var adminBaseUrl = "<?php echo $adminBaseUrl; ?>";
    </script>
</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <!-- /.login-logo -->
        <div class="card card-outline card-primary">
            <div class="card-header text-center">
                Welcome to Fasta fresh Admin
            </div>
            <div class="card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form id="loginForm" type="post" action="<?php echo $adminBaseUrl . '/' . $controllerName . '/login'; ?>">
                    <div class="input-group mb-3">
                        <input type="email" class="form-control" name="email" id="email" required placeholder="Email">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-envelope"></span>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" class="form-control" name="password" id="password" required placeholder="Password">
                        <div class="input-group-append">
                            <div class="input-group-text">
                                <span class="fas fa-lock"></span>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <!-- <div class="col-8">
                            <div class="icheck-primary">
                                <input type="checkbox" id="remember">
                                <label for="remember">
                                    Remember Me
                                </label>
                            </div>
                        </div> -->
                        <!-- /.col -->
                        <div class="col-4">
                            <button type="submit" id="login" class="btn btn-primary btn-block">Sign In</button>
                        </div>
                        <!-- /.col -->
                    </div>
                </form>

                <!-- /.social-auth-links -->

                <!-- <p class="mb-1">
                    <a href="forgot-password.html">I forgot my password</a>
                </p> -->

            </div>
            <!-- /.card-body -->
        </div>
        <!-- /.card -->
    </div>
    <!-- /.login-box -->

    <!-- jQuery -->
    <!-- jQuery -->
    <script src="<?php echo $pluginPath; ?>jquery/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="<?php echo $pluginPath; ?>bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- AdminLTE -->
    <script src="<?php echo $assetPath; ?>js/adminlte.js"></script>
    <script src="<?php echo $pluginPath; ?>jquery-validation-1.19.3/dist/jquery.validate.min.js"></script>
    <script type="text/javascript" src="<?php echo $assetPath; ?>js/pages/login.js"></script>
</body>

</html>