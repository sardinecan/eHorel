function fixDropdown() {   
/*pour l'accès rapide par expéditeur : cible les ul drop de troisième niveau. sinon empêche l'affichage si le deuxième niveau est ciblé.*/
    var dropdown = $('ul.dropdown ul.dropdown ul.dropdown');
    dropdown.css({ 'max-height': 300, 'overflow-y': 'auto' });
}
$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);