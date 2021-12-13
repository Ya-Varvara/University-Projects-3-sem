<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
      <html>
          <body>
              <div><xsl:value-of select="result"/></div>
              <table>
                  <tr>
                      <th style="text-align:left">Число</th>
                      <th style="text-align:left">Разложение</th>
                  </tr>
                  <xsl:for-each select="//number">
                  <tr>
                      <td><xsl:value-of select="number[@type='integer']"/></td>
                      <td><xsl:value-of select="number[@type='integer']//following-sibling::number"/></td>
                  </tr>
                  </xsl:for-each>
              </table>
          </body>
      </html>
  </xsl:template>
</xsl:stylesheet>