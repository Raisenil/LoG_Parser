<?php
$method_counts = array("GET" => array(), "POST" => array(), "HEAD" => array(), "OPTIONS" => array(), "PUT" => array(), "DELETE" => array(), "PATCH" => array());

$filename = "access.log";
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

$output_filename = "log.csv";
$output_file = fopen($output_filename, "w");
if ($output_file) {
    fputcsv($output_file, array("Method", "Status Code", "Count"));
    foreach ($method_counts as $method => $counts) {
        foreach ($counts as $status_code => $count) {
            fputcsv($output_file, array($method, $status_code, $count));
        }
    }
    fclose($output_file);
}
?>
