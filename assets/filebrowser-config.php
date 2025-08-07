<?php

// Root path for file manager
// use absolute path of directory i.e: '/var/www/folder' or $_SERVER['DOCUMENT_ROOT'].'/folder'
$root_path = $_SERVER['DOCUMENT_ROOT'] . 'adm/filebrowser/';

// Root url for links in file manager.Relative to $http_host. Variants: '', 'path/to/subfolder'
// Will not working if $root_path will be outside of server document root
$root_url = 'adm/filebrowser/';

// Login user name and password
// Users: array('Username' => 'Password', 'Username2' => 'Password2', ...)
// Generate secure password hash - https://tinyfilemanager.github.io/docs/pwd.html
$auth_users = [
    'admin' => password_hash($_SERVER['PROD_MANAGEMENT_USER'], PASSWORD_DEFAULT),
    'user'  => $_SERVER['PROD_MANAGEMENT_PASSWORD_HASH'], // Already hashed password
];
