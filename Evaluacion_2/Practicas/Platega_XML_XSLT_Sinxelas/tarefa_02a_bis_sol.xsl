<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="venda/cliente">
   <xsl:element name="{@cod}">
    <xsl:attribute name="num_produtos">
     <xsl:value-of select="count(//produto/@cod)" />
    </xsl:attribute>
   </xsl:element>
  </xsl:template>
</xsl:stylesheet>
