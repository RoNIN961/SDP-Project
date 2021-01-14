<?php
include 'config.php';



if (isset($_POST['Email']) && isset($_POST['Password'])){
    $Email = $_POST['Email'];
    $Password = $_POST['Password'];
    $query = "SELECT * from User where Email='$Email' and Password='$Password'";
    
    $result = mysqli_query($conn,$query);
    $row = mysqli_fetch_assoc($result);
    $rowCount =  mysqli_num_rows($result);

    $json['rowCount'] = $rowCount;
    
    if($rowCount == 1){
        
        $json['User_ID'] = $row['User_ID'];
        $json['Email'] = $row['Email'];
        $json['Username'] = $row['Username'];
    }
    echo json_encode($json);
    mysqli_close($conn);
};

?>