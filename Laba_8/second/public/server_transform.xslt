<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
        <br/><div id="res">Генерация на стороне сервера</div><br/>
        <xsl:choose>
          <xsl:when test="//result='Некорректный ввод!'">
            <p><xsl:value-of select="//result"/></p>
          </xsl:when>
          <xsl:otherwise>
            <p><xsl:value-of select="//result"/></p>
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
          </xsl:otherwise>
        </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
