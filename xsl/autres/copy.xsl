<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  
  <xsl:template match="tei:supportDesc[ancestor::tei:TEI//tei:stamp]">
    <supportDesc>
      <p><xsl:value-of select="normalize-space(./tei:p)"/></p>
      <p>L'enveloppe comporte les cachets suivants : <xsl:for-each select="ancestor::tei:TEI//tei:stamp"><xsl:copy-of select="."></xsl:copy-of></xsl:for-each></p>
    </supportDesc>
  </xsl:template>
  <!--<xsl:template match="tei:TEI[@xml:id]//tei:fileDesc">
    <fileDesc>
      <titleStmt>
        <title><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:date"/></title>
        <author><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:persName[@type='sentBy']"/></author>
        <editor><orgName>B.D.I.C.</orgName></editor>
        <respStmt>
          <resp>Transcription et encodage XML/TEI :</resp>
          <name>Josselin Morvan (étudiant)</name>
        </respStmt>
        <respStmt>
          <resp>Sous la direction de </resp>
          <name>Frédérique Joannic-Seta (directrice adjointe de la <orgName>Bibliothèque de documentation internationale contemporaine</orgName>)</name>
        </respStmt>
      </titleStmt>
      <publicationStmt>
        <publisher>
          <orgName>Bibliothèque de documentation internationale contemporaine</orgName>
          <orgName type="acronym">BDIC</orgName>
          <address>
            <addrLine>6 allée de l'Université</addrLine>
            <addrLine>F-92001 Nanterre Cedex</addrLine>
            <addrLine>France</addrLine>
            <addrLine>http://www.bdic.fr/</addrLine>
          </address>
        </publisher>
        <availability>
          <licence target="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International (CC BY 4.0)</licence>
        </availability>
      </publicationStmt>
      <sourceDesc>
        <msDesc>
          <msIdentifier>
            <country>France</country>
            <settlement>Nanterre</settlement>
            <repository>Bibliothèque de Documentation Internationale Contemporaine</repository>
            <idno>F delta 1854/20</idno>
            <msName><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:persName[@type='sentBy']"/><xsl:text> à </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:persName[@type='deliveredTo']"/><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:placeName"/><xsl:text>, </xsl:text><xsl:value-of select="ancestor::tei:TEI//tei:correspAction/tei:date"/></msName>
          </msIdentifier>
          <physDesc>
            <objectDesc>
              <supportDesc>
                <p><xsl:value-of select="count(ancestor::tei:TEI//tei:div[@type='letter']//tei:pb) div 2"/><xsl:text> carte</xsl:text><xsl:if test="count(ancestor::tei:TEI//tei:div[@type='letter']//tei:pb) &gt; 2"><xsl:text>s</xsl:text></xsl:if><xsl:text> postale</xsl:text><xsl:if test="count(ancestor::tei:TEI//tei:div[@type='letter']//tei:pb) &gt; 2"><xsl:text>s</xsl:text></xsl:if><xsl:choose><xsl:when test=" ancestor::tei:TEI//tei:div[@type='enveloppe']"><xsl:text> et une enveloppe.</xsl:text></xsl:when><xsl:otherwise><xsl:text>.</xsl:text></xsl:otherwise></xsl:choose></p>
              </supportDesc>
            </objectDesc>
          </physDesc>
          <history>
            <provenance>Don de madame la comtesse de La Forest</provenance>
          </history>
        </msDesc>
      </sourceDesc>
    </fileDesc>
  </xsl:template>-->
  
  <xsl:template match="@default | @ident | @instant | @full | @part | @org | @sample | @anchored | @defective"/>
  
  <!--<xsl:template match="tei:TEI//tei:figure"/>-->
  
  <!--<xsl:template match="tei:correspDesc">
    <correspDesc>
      <correspAction>
        <xsl:apply-templates select="tei:correspAction/tei:persName[@type='sentBy']"/>
        <xsl:apply-templates select="tei:correspAction/tei:persName[@type='deliveredTo']"/>
        <xsl:apply-templates select="tei:correspAction/tei:placeName"/>
        <xsl:apply-templates select="tei:correspAction/tei:date"/>
      </correspAction>
      <xsl:apply-templates select="tei:correspContext"/>
    </correspDesc>
  </xsl:template>-->
  
  <!--<xsl:template match="tei:ref[ancestor::tei:correspContext]">
    <xsl:variable name="type" select="@type"/>
    <xsl:variable name="target" select="substring-before(@target,'.xml')"/>
    <ref type="{$type}" target="#{$target}">
      <xsl:apply-templates/>
    </ref>
  </xsl:template>-->
  
  
  <!--<xsl:template match="tei:pb/@facs">
    <xsl:copy><xsl:variable name="facs" select="substring-after(substring-before(.,'.jpg'),'_jpg/')"/>
    <xsl:value-of select="concat('#',$facs)"/></xsl:copy>
  </xsl:template>-->
  
  <!--<xsl:template match="tei:TEI">
    <xsl:copy>
      <xsl:variable name="id" select=".//tei:text/@xml:id"/>
      <xsl:attribute name="xml:id" select="$id"/>
      <xsl:apply-templates/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:text[descendant::tei:div[@type='letter']]/@xml:id"/>
  <xsl:template match="tei:body[descendant::tei:div[@type='letter']]/@xml:id"/>
  <xsl:template match="tei:div[@type='note']/@xml:id"/>
  <xsl:template match="tei:correspDesc/@xml:id"/>
  <xsl:template match="tei:address/@type"/>
  <xsl:template match="tei:address/@place"/>
  
  <xsl:template match="tei:persName[ancestor::tei:address]">
    <xsl:variable name="href" select="@ref"/>
    <xsl:choose>
      <xsl:when test="ancestor::tei:address[@type='deliveredTo']">
        <persName ref="{$href}" type="addressee"><xsl:apply-templates/></persName>
      </xsl:when>
      <xsl:when test="ancestor::tei:address[@type='sentBy']">
        <persName ref="{$href}" type="sender"><xsl:apply-templates/></persName>
      </xsl:when>
      <xsl:otherwise>
        <xsl:apply-templates/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>-->
  
  
  
</xsl:stylesheet>