<?php
$conn = new mysqli("localhost","root","","bas");
?>

<h2>Klant zoeken</h2>

<form method="GET">
    Naam:
    <input type="text" name="naam">
    <button type="submit">Zoeken</button>
</form>

<hr>

<?php
if(isset($_GET['naam'])){
    $naam = $_GET['naam'];

    $sql = "SELECT * FROM klanten WHERE naam LIKE '%$naam%'";
    $result = $conn->query($sql);

    if($result->num_rows > 0){
        while($row = $result->fetch_assoc()){
            echo $row['id'] . " - " . $row['naam'] . "<br>";
        }
    } else {
        echo "Geen resultaten gevonden.";
    }
}
?>