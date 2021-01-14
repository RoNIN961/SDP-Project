<?php
include 'config.php';

    $query = "SELECT Restaurant_Name,Address,Email from Restaurant";
    
    $result = mysqli_query($conn,$query);
    $row = mysqli_fetch_assoc($result);
    $rowCount =  mysqli_num_rows($result);

    $json['rowCount'] = $rowCount;
    
    if($rowCount > 0){
        
        $json['resEmail'] = $row['Email'];
        $json['resName'] = $row['Restaurant_Name'];
        $json['resAddress'] = $row['Address'];
    }
    echo json_encode($json);
    mysqli_close($conn);
;

?>