<?php
$conn = new mysqli("localhost","root","","bas");

if(isset($_GET['delete_id'])){
    $id = $_GET['delete_id'];
    $conn->query("DELETE FROM klanten WHERE id=$id");
    echo "Klant verwijderd!<br><br>";
}

$result = $conn->query("SELECT * FROM klanten");
?>

<h2>Klanten overzicht</h2>

<?php
while($row = $result->fetch_assoc()){
    echo $row['naam'] . 
    " <a href='delete.php?delete_id=".$row['id']."'>Verwijderen</a><br>";
}
?>