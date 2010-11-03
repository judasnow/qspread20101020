<?php 
$con = mysql_connect("localhost","root","");
if (!$con)
  {
  die('Could not connect: ' . mysql_error());
  }

mysql_select_db("quickspread", $con);


//-- begin get /**
 $myfile = 'canada_postal_codes.txt';
 $lines = file($myfile); 
 $data = array();
// print "<br>count_line=".count($lines);die;
 for($i=600000;$i<count($lines);$i++){	
 	$arr_data = explode("|",$lines[$i]);
 	$data[$i]['postal_code_id'] 	= $arr_data[0];
 	$data[$i]['postal_code'] 		= $arr_data[1];
 	$data[$i]['city'] 				= $arr_data[2];
 	$data[$i]['province'] 			= $arr_data[3];
 	$data[$i]['province_code'] 		= $arr_data[4];
 	$data[$i]['city_type'] 			= $arr_data[5];
 	$data[$i]['latitude'] 			= $arr_data[6];
 	$data[$i]['longitude'] 			= $arr_data[7]; 	
 }
// echo "<pre>";print_r($data);
//-- end get file
foreach ( $data as $key=>$value ){
//	print "<br>key=".$key;
//	echo "<pre>";print_r($value);
//	print "<br>value=".$value['postal_code_id'];die;
	$str_sql = 'INSERT INTO vi_country (postal_code_id, postal_code, city, province, province_code, city_type, latitude, longitude)
								VALUES ('.$value["postal_code_id"].', "'.$value["postal_code"].'", "'.$value["city"].'", "'.$value["province"].'", "'.$value["province_code"].'", "'.$value["city_type"].'", "'.$value["latitude"].'", "'.$value["longitude"].'")';
//	print "<br>sql=".$str_sql;
	$result = mysql_query($str_sql);
	
	if (!$result) {
	    die('Invalid query: ' . mysql_error());
	}	
}
?>