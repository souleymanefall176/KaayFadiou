<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>connexion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="asserts/dist/style.css">
    <link rel="stylesheet" href="asserts/css/connexion.css">
    <script type="module" src="asserts/js/connexion.js"></script>
    <script>
    document.addEventListener("DOMContentLoaded", function() {
        <?php
        session_start();
        if (isset($_SESSION['authentication_failed']) && $_SESSION['authentication_failed']) {
            // Réinitialiser la variable de session
            $_SESSION['authentication_failed'] = false;
        ?>
            let loginContainer = document.getElementById("loginContainer");
            let login = document.getElementById("login");
            let logo = document.getElementById("logo");
            let titre = document.getElementById("titre");
            let nomClinique = document.getElementById("nomClinique");
            let infos = document.getElementById("infos");
            
            
            loginContainer.style.backgroundColor = "#fca5a5";
            
            
            login.style.backgroundColor = "#b91c1c";
            
            logo.style.color = "#b91c1c";
            titre.style.color = "#b91c1c";
            nomClinique.style.color = "#b91c1c";
            eye.style.color = "#b91c1c";
            infos.style.color = "#b91c1c";
            infos.innerText = "Incorrect login or password.";

            setTimeout(function() {
                loginContainer.style.backgroundColor = ""; // Réinitialiser à la couleur par défaut
                login.style.backgroundColor = "";
                logo.style.color = "";
                titre.style.color = "";
                nomClinique.style.color = "";
                eye.style.color = "";
            }, 2000);
        <?php
        }
        ?>
    });
    </script>
</head>
<body>
    <section class="bg-gray-50 min-h-screen flex items-center justify-center ">
        <!--login container -->
        <div id="loginContainer" class="bg-[#e0f2fe] flex rounded-xl shadow-lg max-w-3xl p-5">
            <!--image-->
            <div class="w-1/2 flex flex-col items-center justify-center px-8">
                <p id="nomClinique" class="md:block hidden text-center grid-cols-3 text-2xl text-[#3871A6] font-bold"> KaayFadiou </p>
                   
                <i id="logo" class="md:block hidden fa-solid fa-stethoscope text-8xl mt-10 text-[#3871A6]"></i>
            </div>
            <!--form-->
            <div class="md:w-1/2 px-&-">
                <h2 id="titre" class="font-bold text-2xl text-[#3871A6]">Login</h2>
                <p id="infos" class="text-sm  mt-4 text-[#3871A6] text-xs">Please enter your login information.</p>
                <form action="dao/authentification.php" method="post" class="flex flex-col gap-4">
                    <input type="text" name="userName" placeholder="Username" id="userName" class="p-2 mt-8 rounded-xl border w-full" autocomplete="off">
                    <div class="relative">
                        <input type="password" name="password"
                        placeholder="Password" id="password" class="p-2 rounded-xl border w-full" autocomplete="off">
                        <i class="fa-solid fa-eye absolute text-[#3871A6] top-1 right-3 translate-y-1/2" id="eye"></i>
                    </div>
                    <button class="bg-[#3871A6] text-white rounded-xl py-2 hover:scale-110 duration-300" id="login" name="login">Log in</button>
                </form>

                
            </div>
        </div>
        
    </section>
</body>
</html>