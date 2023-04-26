<?php
	require_once('../Purging_Script/log.php');
    
    require_once('../model/logtable.php');
    $logs=getALLData();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Test Table</title>
</head>
<body>
<!--Sidebar-->
<div class="w3-sidebar w3-light-grey w3-bar-block">
    <h3 class="w3-bar-item">Purge</h3>
    <a href="#" class="w3-bar-item w3-button" onclick="location.reload()">NGINX</a>
</div>
<!--Container Main start-->
<div class="container">
    <table class="table">
        <thead class="table-dark">
            <tr>
                <!--<th scope="col">id</th>-->
                <th scope="col">Timestamp</th>
                <th scope="col">Request_Name</th>
                <th scope="col">Status</th>
                <th scope="col">Count</th>
                <th scope="col">Host_Name</th>
            </tr>
        </thead>
        <?php  for($i=0; $i<count($logs); $i++){ ?>
        <tbody>
            <tr>
                <!-- <td scope="row"><?=$logs[$i]['id']?></td> -->
                <td><?=$logs[$i]['Timestamp']?></td>
                <td><?=$logs[$i]['Request_Name']?></td>
                <td><?=$logs[$i]['Status']?></td>
                <td><?=$logs[$i]['Count']?></td>
                <td><?=$logs[$i]['Host_Name']?></td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
</body>
</html>