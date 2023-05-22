<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output encoding="UTF-8" method="html"/> <!-- Configura la salida HTML -->
  
  <!-- Plantilla para el elemento raíz -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Táboa de ordenadores con OS</title>
      </head>
      <body>
        <h1>Táboa de ordenadores con OS</h1>
        <table border="1">
          <tr>
            <th>Máquina</th>
            <th>Tipo</th>
            <th>OS</th>
            <th>Capacidade HD</th>
          </tr>
          
          <!-- Itera sobre los elementos 'máquina' que tienen un elemento 'config/OS' -->
          <xsl:for-each select="equipos/máquina[config/OS]">
            <xsl:sort select="sum(hardware/disco/@capacidade)" order="descending" data-type="number"/>
              
              <!-- Si el valor del elemento 'config/OS' comienza con 'Windows', agrega el atributo 'style' con el valor 'background:yellow' -->
            <xsl:element name="tr">
              <xsl:if test="starts-with(config/OS, 'Windows')">
                <xsl:attribute name="style">background:grey</xsl:attribute>
              </xsl:if>
              
              <td>
                <xsl:value-of select="@nome"/> <!-- Muestra el valor del atributo 'nome' como contenido de la celda -->
              </td>
              <td>
                <xsl:value-of select="hardware/tipo"/> <!-- Muestra el valor del elemento 'hardware/tipo' como contenido de la celda -->
              </td>
              <td>
                <xsl:value-of select="config/OS"/> <!-- Muestra el valor del elemento 'config/OS' como contenido de la celda -->
              </td>
              <td>
                <xsl:choose>
                  <!-- Si la suma de la capacidad de los discos es mayor o igual a 1000, agrega el atributo 'style' con el valor 'color:red' -->
                  <xsl:when test="sum(hardware/disco/@capacidade) &gt;= 1000">
                    <xsl:attribute name="style">color:red</xsl:attribute>
                  </xsl:when>
                  <!-- Si la suma de la capacidad de los discos es mayor o igual a 500, agrega el atributo 'style' con el valor 'color:#FF4500' -->
                  <xsl:when test="sum(hardware/disco/@capacidade) &gt;= 500">
                    <xsl:attribute name="style">color:green</xsl:attribute>
                  </xsl:when>
                  <!-- En caso contrario, agrega el atributo 'style' con el valor 'color:orange' -->
                  <xsl:otherwise>
                    <xsl:attribute name="style">color:blue</xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="sum(hardware/disco/@capacidade)"/> GB <!-- Muestra la suma de la capacidad de los discos seguida de ' GB' como contenido de la celda -->
            </td>
            </xsl:element>
            </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>

</xsl:stylesheet>
