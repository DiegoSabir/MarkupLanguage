<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" indent="yes" method="html"/>
  <xsl:template match="/">
    <html>
      <head/>
      <body>
        <table border="1">
          <tr bgcolor="gray">
            <th>Alumno</th>
            <th>Nota</th>
          </tr>
          <xsl:for-each select="alumnos/alumno">
            <xsl:element name="tr">
              <td>
                <xsl:value-of select="nome"/>
              </td>
              <td>
                <xsl:value-of select="nota"/>
              </td>
            </xsl:element>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
