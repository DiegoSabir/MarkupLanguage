<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  <html>
<body>
<h2>My CD Collection</h2>
<xsl:apply-templates/>

</body>
  </html>
  </xsl:template>
  <xsl:template match="cd">
  <p>
  Title: <xsl:value-of select="title"/><br/>
  Artist: <xsl:value-of select="artist"/> (<xsl:value-of select="year"/>)
  </p>
  </xsl:template>
</xsl:stylesheet>
