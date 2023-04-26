<?php
//Data Purging
$method_counts = array("GET" => array(), "POST" => array(), "HEAD" => array(), "OPTIONS" => array(), "PUT" => array(), "DELETE" => array(), "PATCH" => array());

// $filename = "access.log";
// if (file_exists($filename)) {
//     $file = fopen($filename, "r");
//     while (!feof($file)) {
//         $line = fgets($file);
//         $match = preg_match('/(\d+\.\d+\.\d+\.\d+)\s-\s-\s\[(.*?)\]\s"(GET|POST|HEAD|OPTIONS|PUT|DELETE|PATCH)\s(.*?)\.\d"\s(\d+)\s(\d+)\s"-"\s\"(\d+\.\d+\.\d+\.\d+\:\d+)"\s"(.+)"\s"(\d+\.\d+\.\d+\.\d+)"\s/', $line, $matches);
//         if ($match) {
//             $ip = $matches[1];
//             $timestamp = $matches[2];
//             $method = $matches[3];
//             $path = $matches[4];
//             $status_code = $matches[5];
//             $size_of_response = $matches[6];
//             $user_agent= $matches[7];
//             $handle_request=$matches[8];
//             $host_ip=$matches[9];
//             if (array_key_exists($method, $method_counts)) {
//                 if (!array_key_exists($status_code, $method_counts[$method])) {
//                     $method_counts[$method][$status_code] = 1;
//                 } else {
//                     $method_counts[$method][$status_code]++;
//                 }
//             }
//         }
//     }
//     fclose($file);
// }


$filename = "../Purging_Script/access.log";
if (file_exists($filename)) {
    $file = fopen($filename, "r");
    while (!feof($file)) {
        $line = fgets($file);
        $match = preg_match('/(\d+\.\d+\.\d+\.\d+)\s-\s-\s\[(.*?)\]\s"(GET|POST|HEAD|OPTIONS|PUT|DELETE|PATCH)\s(.*?)\.\d"\s(\d+)\s/', $line, $matches);
        if ($match) {
            $ip = $matches[1];
            $timestamp = $matches[2];
            $method = $matches[3];
            $path = $matches[4];
            $status_code = $matches[5];
            if (array_key_exists($method, $method_counts)) {
                if (!array_key_exists($status_code, $method_counts[$method])) {
                    $method_counts[$method][$status_code] = 1;
                } else {
                    $method_counts[$method][$status_code]++;
                }
            }
        }
    }
    fclose($file);
}
//gethostname
$host_name = gethostname();

//CSV creation
date_default_timezone_set('Asia/Dhaka');
$current_time = time();
$datetime = date("Y-m-d H:i:s", $current_time);
$output_filename = "../Purging_Script/CSV/log.csv";
$output_file = fopen($output_filename, "w");
if ($output_file) {
    fputcsv($output_file, array("Timestamp_csv","Method", "Status_Code", "Count","Host_Name"));
    foreach ($method_counts as $method => $counts) {
        foreach ($counts as $status_code => $count) {
            fputcsv($output_file, array($datetime,$method, $status_code, $count,$host_name));
        }
    }
    fclose($output_file);
}

//DB Connection
require_once('../model/db.php');

//DB Previous data deletion
$conn = getConnection();
$sql="delete from log where Host_Name='$host_name'";
    
if(mysqli_query($conn,$sql)){
}else{
    echo "error deleting Previous Data";
}

//DB Insert data
foreach ($method_counts as $method => $counts) {
    foreach ($counts as $status_code => $count) {
        $sql="insert into log values ('{ }','{$datetime}','{$method}','{$status_code}','{$count}','{$host_name}')";

        if(mysqli_query($conn,$sql)){
        }else{
            echo "Error Inserting to Database";
        }
    }
}
?>
