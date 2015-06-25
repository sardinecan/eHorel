<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:output method="xml" indent="yes" omit-xml-declaration="no" encoding="UTF-8"/>
    
    <xsl:template match="/">
        <!-- pour déclaration DOCTYPE html 5 : -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
            <head>
                <title>Don de Madame la Comtesse de la Forest, Cartes postales illustrées</title>
                <link rel="stylesheet" type="text/css" href="../../STYLE/bootstrap/css/bootstrap.css"/>
            </head>
            <body style="text-align:justify; background-image:url(../../STYLE/images/BACKGROUND_01.jpg)">
                <div class="container">
                    <header class="row">
                        <img src="../../STYLE/images/header.jpg"
                            alt="header"
                            class="img-responsive center-block"/>
                        <nav class="row"><!--insérer des commentaires dans la liste pour supprimer le problème de whitespace-->
                            <ul id="menu_deroulant"><!--whitespace
          --><li><a href="index.html">Accueil</a></li><!--whitespace
          --><li><a href="html/biographie.html">Histoire du groupe</a><!--whitespace
            --><ul><!--whitespace
              --><li><a href="html/biographie.html#barrett">Les années Barrett</a></li><!--sous éléments de biographie renvoyant  vers des ancres dans la page
              --><li><a href="html/biographie.html#waters">Les années Waters</a></li><!--whitespace
              --><li><a href="html/biographie.html#gilmour">Les années Gilmour</a></li><!--whitespace
              --><li><a href="html/biographie.html#apres">L'après Pink Floyd</a></li><!--whitespace
            --></ul><!--whitespace
          --></li><!--
          --><li><a href="html/membres.html">Membres</a></li><!--
          --><li><a>oeuvre</a><!-- oeuvre n'est pas un lien, contient juste deux sous éléments (idem voir aussi) 
            --><ul><!--whitespace
              --><li><a href="html/discographie.html">Discographie</a></li><!--whitespace
              --><li><a href="html/filmographie.html">Filmographie</a></li><!--whitespace
            --></ul><!--whitespace
          --></li><!--whitespace
          --><li><a href="html/bibliographie.html">Bibliographie</a></li>
                            </ul>
                        </nav>
                    </header>
                </div>
<div><xsl:apply-templates/></div>
            </body>
        </html>
    </xsl:template>
    
</xsl:stylesheet>