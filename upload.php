<?php // display file upload form
include "connectdb.php";
if (!isset($_POST['submit'])) { ?>
<form enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF']?>" method="post">

<input type="hidden" name="MAX_FILE_SIZE" value="8000000" /> Select file:

<input type="file" name="data" />
 <label>UserName  :</label><input type = "text" name = "name" class = "box"/><br /><br />
                  <label>Youtube:</label><input type = "text" name = "youtube" class = "box" /><br/><br />

<input type="submit" name="submit" value="Upload File" /></form>

<?php
} else {
// check uploaded file size
if ($_FILES['data']['size'] == 0) {
die("ERROR: Zero byte file upload");
}
// check if file type is allowed (optional)
$allowedFileTypes = array("video/mp4", "image/jpeg", "image/pjpeg");
if (!in_array($_FILES['data']['type'], $allowedFileTypes)) {
die("ERROR: File type not permitted");
} // check if this is a valid upload
if (!is_uploaded_file($_FILES['data']['tmp_name'])) {
die("ERROR: Not a valid file upload"); } // set the name of the target directory
$uploadDir = "./upload/"; // copy the uploaded file to the directory
move_uploaded_file($_FILES['data']['tmp_name'], $uploadDir . $_FILES['data']['name']) or die("Cannot copy uploaded file"); // display success message


  $name = $_POST['name'];
  $youtube = $_POST['youtube'];
   $path =$uploadDir .$_FILES['data']['name'];



     $data = array();
     if($name != null && $name != "")
     {
        if ($youtube != null && $youtube != "") 
        {
            $sql = "Call      uploadfile   ('$name','$youtube','$path','$dateuploaded')";
            $result = mysqli_query($dbhandle,$sql);

     $d = new DateTime('2011-01-01T15:03:01.012345Z');
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

echo "File successfully uploaded to " . $uploadDir .$_FILES['data']['name']; } ?>