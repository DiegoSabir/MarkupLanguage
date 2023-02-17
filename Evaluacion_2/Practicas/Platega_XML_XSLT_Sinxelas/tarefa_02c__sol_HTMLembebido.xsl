<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output encoding="UTF-8" method="html"/>
    <xsl:template match="/">
      <html>
        <head>
         <META http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
         <title>Cliente <xsl:value-of select="//cliente/@cod" /></title>
        </head>
        <body>
         <p>Cliente:<xsl:value-of select="//cliente/@cod" /> </p>
         <p>Número de produtos:<xsl:value-of select="count(//produto)" />  </p>
        </body>
      </html>
    </xsl:template>
</xsl:stylesheet>