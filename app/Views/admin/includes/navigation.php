        <!-- Main Sidebar Container -->
        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <!-- Brand Logo -->
            <a href="#" class="brand-link">
                <img src="<?php echo $assetPath; ?>img/logo.jpeg" alt="FastaFresh" class="brand-image img-circle elevation-3" style="opacity: .8">
                <span class="brand-text font-weight-light">FastaFresh</span>
            </a>

            <!-- Sidebar -->
            <div class="sidebar">
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                    <div class="image">
                        <img src="<?php echo $assetPath; ?>img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
                    </div>
                    <div class="info">
                        <a href="#" class="d-block">Welcome Admin</a>
                    </div>
                </div>

                <!-- Sidebar Menu -->
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                        <?php foreach ($userMenus as $key => $value) { ?>
                            <?php if ($value['childMenus']) { ?>
                                <li class="nav-item">
                                    <a href="#" class="nav-link">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>
                                            <?php echo $value['name']; ?>
                                            <i class="fas fa-angle-left right"></i>
                                        </p>
                                    </a>
                                    <ul class="nav nav-treeview">
                                        <?php foreach ($value['childMenus'] as $k => $val) { ?>
                                            <li class="nav-item">
                                                <a href="<?php echo $adminBaseUrl . '/' . $val['landing_url']; ?>" class="nav-link">
                                                    <i class="far fa-circle nav-icon"></i>
                                                    <p><?php echo $val['name']; ?></p>
                                                </a>
                                            </li>
                                        <?php } ?>
                                    </ul>
                                </li>
                            <?php } else { ?>
                                <li class="nav-item">
                                    <a href="<?php echo $adminBaseUrl . '/' . $value['landing_url']; ?>" class="nav-link">
                                        <i class="nav-icon fas fa-calendar-alt"></i>
                                        <p>
                                            <?php echo $value['name']; ?>
                                        </p>
                                    </a>
                                </li>
                            <?php } ?>
                        <?php } ?>
                        <li class="nav-item">
                            <a href="<?php echo $adminBaseUrl . '/login/logout'; ?>" class="nav-link">
                                <i class="nav-icon fas fa-columns"></i>
                                <p>
                                    Logout
                                </p>
                            </a>
                        </li>
                    </ul>
                </nav>
                <!-- /.sidebar-menu -->
            </div>
            <!-- /.sidebar -->
        </aside>