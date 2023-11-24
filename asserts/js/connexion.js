const userName = document.getElementById("userName");
const password = document.getElementById("password");
const eye = document.getElementById("eye");

/*Fonction qui verifie si longueur de chaine comprise entre min et max */
const checkLength = (chaine, min, max) =>
  chaine.length >= min && chaine.length <= max;

/**Partie userName Debut */

/*userName doit contenir des lettres majuscules, minuscules, des chiffres et des caracteres comme -, et _*/
const checkChaine = function (chaine) {
  let maChaine = chaine.trim(); // Supprime les espaces en début et fin de chaîne
  for (let i = 0; i < maChaine.length; i++) {
    let car = maChaine[i];
    if (
      car === " " || // Ajout de cette condition pour vérifier les espaces
      !(
        (car.toUpperCase() >= "A" && car.toUpperCase() <= "Z") ||
        (car >= "0" && car <= "9") ||
        car == "-" ||
        car == "_"
      )
    ) {
      return false;
    }
  }
  return true;
};

/*Fonction qui verifie si userName rempli toutes les conditions */
const checkUserName = (userName) =>
  checkLength(userName, 3, 30) && checkChaine(userName);

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

/*Fonction qui verifie si password contient entre 12 et 20 caracteres */
const checkPassword = (password) => checkLength(password, 12, 20);

/*evenement declenche quand on quitte champ de saisie password */
password.addEventListener("blur", (e) => {
  if (
    !checkPassword(password.value) &&
    !password.classList.contains("valuError")
  ) {
    password.classList.add("valuError");
  } else if (
    checkPassword(userName.value) &&
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
