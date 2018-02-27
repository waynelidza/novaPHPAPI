 
<?php 
header("Access-Control-Allow-Headers: Authorization, Content-Type");
header("Access-Control-Allow-Origin: *");
header('content-type: application/json; charset=utf-8');
	include "connectdb.php";



	$_POST = json_decode(file_get_contents("php://input"),true);






      
    

	
    
	   $data = array();
   
            $sql = "Call    	countUsers   ()";
            $result = mysqli_query($dbhandle,$sql);

            if(mysqli_num_rows($result) > 0)
            {
               while($rows = mysqli_fetch_assoc($result)) 
               {
                    $data[] = $rows;
               }

            }
          
        
     
     
  
    

    echo json_encode($data);
?>