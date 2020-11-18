<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
  <xsl:template match="/">
    <xsl:result-document href="docs/select.html" method="html">
      <html>
        <head>
          <title>Axway API Guideline Generator</title>
          <script>document.getElementsByTagName("html")[0].className += " js";</script>
          <link rel="stylesheet" href="assets/css/style.css"/>
        </head>
        <body>
          <ul class="cd-accordion cd-accordion--animated margin-top-lg margin-bottom-lg">
            <xsl:for-each select="guide/guidelines/guideline">
              <xsl:sort select="title/text()"/>
              <xsl:variable name="number" select="position()"/>
              <li class="cd-accordion__item cd-accordion__item--has-children">
                <input class="cd-accordion__input" type="checkbox" name="group-{$number}"
                  id="group-{$number}"/>
                <label class="cd-accordion__label cd-accordion__label--icon-folder"
                  for="group-{$number}">
                  <span title="{teaser/text()}">
                    <xsl:value-of select="concat($number, '. ', title/text())"/>
                  </span>
                </label>
                <div class="cd-accordion__sub cd-accordion__sub--l1">
                  <xsl:copy-of select="text/node()"/>
                  <ul>
                    <xsl:for-each select="what">
                      <xsl:sort select="title/text()"/>
                      <xsl:variable name="number" select="concat($number, '.', position())"/>
                      <li class="cd-accordion__item cd-accordion__item--has-children">
                        <input class="cd-accordion__input" type="checkbox"
                          name="sub-group-{$number}" id="sub-group-{$number}"/>
                        <label class="cd-accordion__label cd-accordion__label--icon-folder"
                          for="sub-group-{$number}">
                          <span title="{teaser/text()}">
                            <xsl:value-of select="concat($number, ' ', title/text())"/>
                          </span>
                        </label>
                        <div class="cd-accordion__sub cd-accordion__sub--l3">
                          <xsl:copy-of select="text/node()"/>
                          <ul>
                            <xsl:for-each select="why">
                              <xsl:sort select="title/text()"/>
                              <li class="cd-accordion__item">
                                <a href="#" class="subitem" title="{teaser/text()}">
                                  <xsl:value-of select="title/text()"/>
                                </a>
                                <div>
                                  <xsl:copy-of select="text/node()"/>
                                </div>
                              </li>
                            </xsl:for-each>
                          </ul>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </li>
            </xsl:for-each>
          </ul>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>
