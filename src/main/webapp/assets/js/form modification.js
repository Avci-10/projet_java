document.getElementById("formmodif").addEventListener("submit", function (e) {


    const nom = document.getElementById("nomComplet").value;
    let regexNom = /^[a-zA-Z\s.]+$/;
    if (nom === "" || !regexNom.test(nom)) {
        alert("nom est vide ou invalide ");
        e.preventDefault();
        return;
    }

    let regexGmail = /^[a-zA-Z0-9\s.]+@[a-z]{5,7}\.[a-z]{2,4}$/;
    const email = document.getElementById("email").value;
    if (email === "" || !regexGmail.test(email)) {
        alert("het  adresse email ou adress non valide ");
        e.preventDefault();
        return;
    }
    const mdp = document.getElementById("mdp").value;
    if (mdp === "" || mdp.length <= 6) {
        alert(" mot de passe ou inf a 6 caractere");
        e.preventDefault();
        return;
    }
});