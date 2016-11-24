<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="tei" version="2.0">
    
    <xsl:template match="//tei:teiCorpus" mode="chronologie">
        <xsl:result-document encoding="UTF-8" href="chronologie.html">
            <!-- pour déclaration DOCTYPE html 5 : -->
            <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>
            <html>
                <head>
                    <title>Correspondance d'Armand Horel</title>
                    <meta charset="utf-8"/>
                    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                    <!--feuilles de style-->  
                    <link rel="stylesheet" href="style/foundation/foundation.css" />
                    <link rel="stylesheet" type="text/css" href="style/foundation/app.css"/>
                    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'/>
                    <link rel="stylesheet" href="js/timeline/dist/timeline.min.css"/>
                    
                    <script src="js/foundation/vendor/jquery.js">/*pour transformation xslt*/</script>
                    <script src="js/timeline/dist/timeline.min.js">/*pour transformation xslt*/</script>
                    <script src="js/timeline/src/api/scripts/l10n/en/timeline.js">/*pour transformation xslt*/</script>
                    <script src="js/timeline/src/api/scripts/l10n/en/labellers.js">/*pour transformation xslt*/</script>
                    <script src="js/timeline/timeline.js">/*pour transformation xslt*/</script>
                </head>
                <body onload="onLoad();" onresize="onResize();">
                    <xsl:copy-of select="$header"/>
                    <xsl:copy-of select="$headerSlide"/>
                    <div class="row">
                        <div class="large-12 columns">
                            <h2>Accès chronologique</h2>
                            <p>Cette frise chronologique propose un accès chrono-géographique à la correspondances d'Armand Horel. Cette frise est complétée par quelques événements importants du conflit, permettant de replacer cette correspondance dans son contexte.</p>
                            <div id="tl"></div>
                            <!--<div id="frise"><xsl:comment>pour traitement xslt</xsl:comment></div>-->
                        </div>
                    </div>
                    <xsl:copy-of select="$footer"/>
                    <xsl:copy-of select="$js"/>
                </body>
            </html>
        </xsl:result-document>
    </xsl:template>
    
    <xsl:template match="tei:teiCorpus" mode="frise">
        <xsl:result-document encoding="UTF-8" href="date.xml">
            <date>
                <event start="1915-01-13" title="Acceptation du projet d'attaque navale des Dardanelles" icon="js/timeline/dist/src/api/images/boat.png">Le conseil de guerre britannique approuve le projet d'attaque navale contre les Dardanelles proposée par Winston Churchill en novembre 1914.</event>
                <event start="1915-02-19" title="Première attaque du détroit des Dardanelles" icon="js/timeline/dist/src/api/images/boat.png">Première attaque navale du détroit des Dardanelles par les vaisseaux HMS Cornwallis, HMS Vengeance et Suffren.</event>
                <event start="1915-02-25" title="Deuxième attaque du détroit des Dardanelles" icon="js/timeline/dist/src/api/images/boat.png">Seconde attaque du détroit des Dardanelles.</event>
                <event start="1915-03-18" title="Troisième attaque du détroit des Dardanelles" icon="js/timeline/dist/src/api/images/boat.png">La flotte française et britannique tente un passage en force du détroit des Dardanelles. Le HMS irresistible, le HMS Ocean et le Bouvet sont coulés par des mines, et les cuirassés français Suffren et Gaulois, et l'HMS Inflexible sont sévèrement endommagés. L'offensive navale du détroit des Dardanelles est abandonées et l'on commence à envisager un débarquement.</event>
                <event start="1915-04-25" title="Campagne terrestre de Gallipoli" icon="js/timeline/dist/src/api/images/explosion.png">Début de l'offensive terrestre. Les Français débarquent sur la rive asiatique de la péninsule et parviennent à prendre le fort de Koum-Kalé. Sur la rive occidentale, les Britanniques débarquent au sud de la péninsule et les ANZAC, corps d'armée composé d'Australiens et de Néo-Zélandais, sont déployés plus au nord ; c'est un échec. Les troupes françaises sont alor redéployées sur la rive occidentale, mais ici aussi la situation s'enlise.</event>
                <event start="1915-10-05" title="Débarquement à Salonique" icon="js/timeline/dist/src/api/images/dark-red-circle.png">Débarquement de troupes françaises et britanniques à Salonique en Grèce (auj. Thessalonique), suite à l'entrée en guerre de la Bulgarie aux côtés des puissances centrales. La Grèce souhaite rester neutre. Toutefois, Elefthérios Venizélos, premier ministre grec, est favorable à l'Entente alors que le roi Constantin 1er est plus proche des puissances centrales. Ce désaccord aboutira, en 1916, au « schisme national ».</event>
                <event start="1915-10-14" title="Entrée en guerre de la Bulgarie" icon="js/timeline/dist/src/api/images/explosion.png">La Bulgarie entre en guerre aux côtés des puissances centrales.</event>
                <event start="1915-12-15" title="Ordre d'évacuer les Dardanelles" icon="js/timeline/dist/src/api/images/dark-red-circle.png">L'ordre d'évacuation des troupes de la Triple-Entente est donné.</event>
                <event start="1916-01-08" title="Fin de l'évacuation des Dardanelles" icon="js/timeline/dist/src/api/images/dark-red-circle.png">L'évacuation de la péninsule par la Triple-Entent est achevée.</event>
                <event start="1916-06-01" title="Entrée des troupes bulgares en Grèce" icon="js/timeline/dist/src/api/images/dark-red-circle.png">Entrée des troupes bulgare en Grèce.</event>
                <xsl:for-each select=".//tei:correspAction">
                    <event start="{./tei:date/@when | tei:date/@from}" title="{concat(./tei:placeName,', ',./tei:date)}" icon="js/timeline/dist/src/api/images/lettre.png">&lt;a href="<xsl:value-of select="ancestor::tei:TEI/@xml:id"/>.html"&gt;<xsl:value-of select="./tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:value-of select="./tei:persName[@type='deliveredTo']"/>&lt;/a&gt;<xsl:text>.</xsl:text></event>
                </xsl:for-each>
            </date>
        </xsl:result-document>
    </xsl:template>
    
</xsl:stylesheet>