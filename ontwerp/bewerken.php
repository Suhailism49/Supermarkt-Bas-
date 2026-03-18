<?php
$conn = new mysqli("localhost","root","","bas");

if(!isset($_GET['id'])){
    echo "Geen klant gekozen";
    exit;
}

$id = $_GET['id'];

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $naam = $_POST['naam'];
    $email = $_POST['email'];
    $telefoon = $_POST['telefoon'];

    $sql = "UPDATE klanten 
            SET naam='$naam', email='$email', telefoon='$telefoon'
            WHERE id=$id";

    $conn->query($sql);

    echo "Klant bijgewerkt!<br>";
}

$result = $conn->query("SELECT * FROM klanten WHERE id=$id");
$row = $result->fetch_assoc();
?>

<h2>Klant bewerken</h2>

<form method="POST">

Naam:<br>
<input type="text" name="naam" value="<?php echo $row['naam']; ?>"><br><br>

Email:<br>
<input type="email" name="email" value="<?php echo $row['email']; ?>"><br><br>

Telefoon:<br>
<input type="text" name="telefoon" value="<?php echo $row['telefoon']; ?>"><br><br>

<button type="submit">Opslaan</button>

</form>