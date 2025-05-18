<?php 
require_once 'php_action/core.php';

// Assuming userType is stored in the session after login
$userType = isset($_SESSION['type']) ? $_SESSION['type'] : null; 
?>

<!DOCTYPE html>
<html>
<head>
    <title>Stock Management System</title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="assests/bootstrap/css/bootstrap.min.css">
    <!-- bootstrap theme -->
    <link rel="stylesheet" href="assests/bootstrap/css/bootstrap-theme.min.css">
    <!-- font awesome -->
    <link rel="stylesheet" href="assests/font-awesome/css/font-awesome.min.css">

    <!-- custom css -->
    <link rel="stylesheet" href="custom/css/custom.css">

    <!-- DataTables -->
    <link rel="stylesheet" href="assests/plugins/datatables/jquery.dataTables.min.css">

    <!-- file input -->
    <link rel="stylesheet" href="assests/plugins/fileinput/css/fileinput.min.css">

    <!-- jquery -->
    <script src="assests/jquery/jquery.min.js"></script>
    <!-- jquery ui -->  
    <link rel="stylesheet" href="assests/jquery-ui/jquery-ui.min.css">
    <script src="assests/jquery-ui/jquery-ui.min.js"></script>

    <!-- bootstrap js -->
    <script src="assests/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <!-- Brand and toggle -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>

        <!-- Navigation -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">      
            <ul class="nav navbar-nav navbar-left">
                <li id="logo" style="list-style: none; margin: 0;">
                    <a href="">
                        <img src="includes/LogoImage_outbg.png" alt="Logo" style="height: 30px;">
                        <img src="includes/LogoText_outbg.png" alt="Logo" style="height: 30px;">
                    </a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">        
                
                
                <?php if ($userType == 1) { // Admin ?>
                    <li id="navDashboard"><a href="dashboard.php"><i class="glyphicon glyphicon-list-alt"></i> Dashboard</a></li>
                    <li id="navBrand"><a href="brand.php"><i class="glyphicon glyphicon-btc"></i> Brand</a></li>
                    <li id="navCategories"><a href="categories.php"><i class="glyphicon glyphicon-th-list"></i> Category</a></li>
                    <li id="navProduct"><a href="product.php"><i class="glyphicon glyphicon-ruble"></i> Product</a></li>
                    <li class="dropdown" id="navOrder">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="glyphicon glyphicon-shopping-cart"></i> Orders <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li id="topNavAddOrder"><a href="orders.php?o=add"><i class="glyphicon glyphicon-plus"></i> Request For Orders</a></li>
                            <li id="topNavManageOrder"><a href="orders.php?o=manord"><i class="glyphicon glyphicon-edit"></i> Manage Orders</a></li>
                        </ul>
                    </li>
                    <li id="navReport"><a href="report.php"><i class="glyphicon glyphicon-check"></i> Report</a></li>
                    <li class="dropdown" id="navSetting">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="glyphicon glyphicon-user"></i> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li id="topNavSetting"><a href="setting.php"><i class="glyphicon glyphicon-wrench"></i> Setting</a></li>
                        <li id="topNavLogout"><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                    </ul>
                    <li><h4 style="color: blue; text-align: center; font-weight: bold;">ADMIN</h4></li>
                    
                </li>
                <?php } elseif ($userType == 3) { // Supplier ?>
                    <li id="navProduct"><a href="supplier_product.php"><i class="glyphicon glyphicon-ruble"></i> Product</a></li>
                    <li class="dropdown" id="navSetting">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="glyphicon glyphicon-user"></i> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li id="topNavSetting"><a href="setting.php"><i class="glyphicon glyphicon-wrench"></i> Setting</a></li>
                        <li id="topNavLogout"><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                    </ul>
                    <li><h4 style="color: orange; text-align: center; font-weight: bold;">SUPPLIER</h4></li>
                </li>
                <?php } elseif ($userType == 0) { // Employee ?>
                    <li id="navBrand"><a href="brand.php"><i class="glyphicon glyphicon-btc"></i> Brand</a></li>
                    <li id="navCategories"><a href="categories.php"><i class="glyphicon glyphicon-th-list"></i> Category</a></li>
                    <li id="navProduct"><a href="employee_product.php"><i class="glyphicon glyphicon-ruble"></i> Product</a></li>
                    <li class="dropdown" id="navOrder">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                            <i class="glyphicon glyphicon-shopping-cart"></i> Orders <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li id="topNavAddOrder"><a href="orders.php?o=add"><i class="glyphicon glyphicon-plus"></i> Request For Orders</a></li>
                            <li id="topNavManageOrder"><a href="orders.php?o=manord"><i class="glyphicon glyphicon-edit"></i> Manage Orders</a></li>
                        </ul>
                    </li>
                    <li id="navReport"><a href="report.php"><i class="glyphicon glyphicon-check"></i> View Report</a></li>
                    <li class="dropdown" id="navSetting">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                        <i class="glyphicon glyphicon-user"></i> <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li id="topNavSetting"><a href="setting.php"><i class="glyphicon glyphicon-wrench"></i> Setting</a></li>
                        <li id="topNavLogout"><a href="logout.php"><i class="glyphicon glyphicon-log-out"></i> Logout</a></li>
                    </ul>
                    <li><h4 style="color: green; text-align: center; font-weight: bold;">EMPLOYEE</h4></li>
                </li>
                <?php } ?>

                        
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="container">
