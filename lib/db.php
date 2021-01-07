<?php
$dns = ‘mysql:host=localhost;dbname=id15473361_foodamore’;
$user = ‘id15473361_admin’;
$password = ‘C<E6\xR*GHWouQ8’;try{
 $db = new PDO ($dns, $user, $pass);
}catch( PDOException $e){
 $error = $e->getMessage();
 echo $error;
}