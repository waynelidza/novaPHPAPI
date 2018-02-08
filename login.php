<?php 
header("Access-Control-Allow-Headers: Authorization, Content-Type");
header("Access-Control-Allow-Origin: *");
header('content-type: application/json; charset=utf-8');
	include "connectdb.php";



	$_POST = json_decode(file_get_contents("php://input"),true);






      
    

	$username = $_POST['username'];
	$mypasswords = $_POST['mypasswords'];
    
	   $data = array();
     if($username != null && $username != "")
     {
        if ($mypasswords != null && $mypasswords != "") 
        {
            $sql = "Call    userLogin   ('$username','$mypasswords')";
            $result = mysqli_query($dbhandle,$sql);

            if(mysqli_num_rows($result) > 0)
            {
               while($rows = mysqli_fetch_assoc($result)) 
               {
                    $data[] = $rows;
               }

            }
            else
            {

                // $data[] = "";
                http_response_code(401);



                
            }
        }
        else
        {
            $data[] = "No";
        }
     }
     else
     {
        $data[] = "No";
     }
    

    echo json_encode($data);
?>