<?php
require_once('connect_bdd.php');

function authenticateUser($userName, $password) {
    global $conn;

    $recupUser = $conn->prepare('SELECT login, password FROM users WHERE login = ? AND password = ?');
    $recupUser->execute(array($userName, $password));

    return $recupUser->rowCount() > 0;
}

if (isset($_POST['login'])) {
    if (!empty($_POST['userName']) && !empty($_POST['password'])) {
        $userName = htmlspecialchars($_POST['userName']);
        $password = htmlspecialchars($_POST['password']);

        if (authenticateUser($userName, $password)) {
            $basePath = dirname(__FILE__);
            $dashboardPath = '../pages/administrator.php';
            
            header('Location: ' . $dashboardPath);

            
            exit();
        } else {
            session_start();
            $_SESSION['authentication_failed'] = true;
            $dashboardPath = '../index.php';
            header('Location: ' . $dashboardPath);
        }
    } else {
        echo "Veuillez compléter tous les champs.";
    }
}
?>
