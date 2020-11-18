<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:template match="/">
    <xsl:result-document href="select.html" method="html">
      <html>
        <head>
          <title>Axway API Guideline Generator</title>
          <style>
ol { counter-reset: item }
li { display: block }
li:before { content: counters(item, ".") " "; counter-increment: item }
          </style>
        </head>
        <body>
          <h1>Axway API Guideline Generator</h1>
        </body>
        <ol>
          <xsl:for-each select="guide/guidelines/guideline">
            <xsl:sort select="title/text()"/>
            <li>
              <span title="{teaser/text()}">
                <xsl:value-of select="title/text()"/>
              </span>
              <ol>
                <xsl:for-each select="what">
                  <xsl:sort select="title/text()"/>
                  <li>
                    <span title="{teaser/text()}">
                      <xsl:value-of select="title/text()"/>
                    </span>
                    <ol>
                      <xsl:for-each select="how">
                        <xsl:sort select="title/text()"/>
                        <li>
                          <span title="{teaser/text()}">
                            <xsl:value-of select="title/text()"/>
                          </span>
                        </li>
                      </xsl:for-each>
                    </ol>
                  </li>
                </xsl:for-each>
              </ol>
            </li>
          </xsl:for-each>
        </ol>
      </html>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>