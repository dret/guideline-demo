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
.accordion { background-color: #eee; color: #444; cursor: pointer; padding: 18px; width: 100%; border: none; text-align: left; outline: none; font-size: 15px; transition: 0.4s; }
.active, .accordion:hover { background-color: #ccc; }
.panel { padding: 0 18px; background-color: white; max-height: 0; overflow: hidden; transition: max-height 0.2s ease-out; }
          </style>
        </head>
        <body>
          <h1>Axway API Guideline Generator</h1>
          <form>
            <ol>
              <xsl:for-each select="guide/guidelines/guideline">
                <xsl:sort select="title/text()"/>
                <button class="accordion" title="{teaser/text()}">
                  <xsl:value-of select="title/text()"/>
                </button>
                <div class="panel">
                  <p>
                    <xsl:copy-of select="text"/>
                  </p>
                  <xsl:for-each select="what">
                    <xsl:sort select="title/text()"/>
                    <button class="accordion" title="{teaser/text()}">
                      <xsl:value-of select="title/text()"/>
                    </button>
                    <div class="panel">
                      <p>
                        <xsl:copy-of select="text"/>
                      </p>
                      <xsl:for-each select="how">
                        <xsl:sort select="title/text()"/>
                        <button class="accordion" title="{teaser/text()}">
                          <xsl:value-of select="title/text()"/>
                        </button>
                        <div class="panel">
                          <p>
                            <xsl:copy-of select="text"/>
                          </p>
                        </div>
                      </xsl:for-each>
                    </div>
                  </xsl:for-each>
                </div>
              </xsl:for-each>
            </ol>
          </form>
          <script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i &lt; acc.length; i++) {
acc[i].addEventListener("click", function() {
this.classList.toggle("active");
var panel = this.nextElementSibling;
if (panel.style.maxHeight) {
panel.style.maxHeight = null;
} else {
panel.style.maxHeight = panel.scrollHeight + "px"; } }); }
          </script>
        </body>
      </html>
    </xsl:result-document>
  </xsl:template>
</xsl:stylesheet>