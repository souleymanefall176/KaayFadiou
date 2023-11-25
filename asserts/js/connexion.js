const userName = document.getElementById("userName");
const password = document.getElementById("password");
const eye = document.getElementById("eye");

/**Partie userName Debut */

/*userName doit contenir des lettres majuscules, minuscules, des chiffres et des caracteres comme -, et _*/
const checkUserName = function (chaine) {
  let maChaine = chaine.trim(); // Supprime les espaces en début et fin de chaîne
  let regex = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z0-9]{3,30}$/;
  return regex.test(maChaine);
};

/*evenement declenche quand on quitte champ de saisie userName */
userName.addEventListener("blur", (e) => {
  if (
    !checkUserName(userName.value) &&
    !userName.classList.contains("valuError")
  ) {
    userName.classList.add("valuError");
  } else if (
    checkUserName(userName.value) &&
    userName.classList.contains("valuError")
  ) {
    userName.classList.remove("valuError");
  }
});
/**Partie userName Fin */

/**Partie password Debut */

const checkPassword = function (password) {
  // let myPassword = password.trim(); // Supprime les espaces en début et fin de chaîne
  /* devrait contenir au moins un chiffre
   devrait contenir au moins une lettre minuscule
   devrait contenir au moins une lettre majuscule
   devrait contenir au moins un caractère spécial parmi @$!%*?&
   devrait contenir uniquement des caractères spécifiés (lettres, chiffres, caractères spéciaux) et avoir une longueur d'au moins 8 caractères*/
  let regex =
    /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&])[a-zA-Z0-9@$!%*?&]{8,}/;
  return regex.test(password);
};

/*evenement declenche quand on quitte champ de saisie password */
password.addEventListener("blur", (e) => {
  if (
    !checkPassword(password.value) &&
    !password.classList.contains("valuError")
  ) {
    password.classList.add("valuError");
  } else if (
    checkPassword(password.value) &&
    password.classList.contains("valuError")
  ) {
    password.classList.remove("valuError");
  }
});

/*evenement declenche au clique de eye*/
eye.addEventListener("click", (e) => {
  e.preventDefault();
  if (eye.classList.contains("fa-eye")) {
    eye.classList.remove("fa-eye");
    eye.classList.add("fa-eye-slash");
    password.type = "text";
  } else {
    eye.classList.remove("fa-eye-slash");
    eye.classList.add("fa-eye");
    password.type = "password";
  }
});

/**Partie password Fin */
