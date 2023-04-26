<?php
    require_once('db.php');

    function getALLData(){
        $conn=getConnection();
        $sql="Select * from log";
        $result = mysqli_query($conn,$sql);
        $logs=[];

        while($log=mysqli_fetch_assoc($result)){
            array_push($logs,$log);
        }
        
        return $logs;
    }
?>