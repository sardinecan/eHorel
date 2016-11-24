<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"  
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="xs tei"    
  version="2.0">
  
  <xsl:template match="@* | node()" exclude-result-prefixes="#all">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
  
  <xsl:template match="tei:facsimile/tei:graphic[@xml:id=//tei:figure/tei:graphic/@url]">
    <xsl:variable name="id" select="@xml:id"/>
    <xsl:variable name="url" select="@url"/>
    <graphic xml:id="{$id}" url="{$url}">
      <desc><xsl:value-of select="//tei:figure[child::tei:graphic[@url=$id]]/tei:figDesc"/></desc>
    </graphic>
  </xsl:template>
  
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