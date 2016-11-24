function fixDropdown() {
    /*pour l'accès rapide par expéditeur : cible les ul drop de troisième niveau. sinon empêche l'affichage si le deuxième niveau est ciblé.*/
    var dropdown = $('ul.menu ul.menu ul.menu ul.menu');
    dropdown.css({
        'max-height': 300, 'overflow-y': 'auto'
    });
}
$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);