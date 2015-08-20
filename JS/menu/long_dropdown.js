function fixDropdown() {    
    var dropdown = $('ul.dropdown ul.dropdown ul.dropdown');/*pour l'accès rapide par expéditeur : cible les ul drop de troisième niveau. sinon empêche l'affichage si on sible le deuxième.*/
    dropdown.css({ 'max-height': 300, 'overflow-y': 'auto' });
}
$(window).on('load', fixDropdown);
$(window).on('resize', fixDropdown);