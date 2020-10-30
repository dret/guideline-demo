<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:variable name="root" select="'./'"/>
  <xsl:variable name="index-name" select="'README'"/>
  <xsl:variable name="file-suffix" select="'.md'"/>
  <xsl:variable name="link-suffix" select="'.md'"/>
  <xsl:variable name="apos" select='"&apos;"'/>
  <xsl:template match="/">
    <xsl:result-document href="{$root}{$index-name}{$file-suffix}" method="text">
      <xsl:text># Axway API Guideline Generator&#xa;&#xa;</xsl:text>
      <xsl:for-each select="guide/guidelines/guideline">
        <xsl:sort select="title/text()"/>
        <xsl:text>- [</xsl:text>
        <xsl:value-of select="title/text()"/>
        <xsl:text>](why/</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>/ "</xsl:text>
        <xsl:value-of select="teaser/text()"/>
        <xsl:text>")&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>