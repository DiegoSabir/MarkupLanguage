<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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
          
          <!-- Aplica la plantilla a los elementos 'máquina' que tengan un elemento 'config/OS' -->
          <!-- Ordena los resultados por la suma de la capacidad de los discos en orden descendente -->
          <xsl:apply-templates select="equipos/máquina[config/OS]">
            <xsl:sort select="sum(hardware/disco/@capacidade)" order="descending" data-type="number" />
          </xsl:apply-templates>
          
        </table>
      </body>
    </html>
  </xsl:template>
  
  <!-- Plantilla para el elemento 'máquina' -->
  <xsl:template match="máquina">
    <xsl:element name="tr">
      <!-- Si el valor del elemento 'config/OS' comienza con 'Windows', agrega el atributo 'style' con el valor 'background:yellow'
      Asi afectaria a toda la fila de la tabla -->
      <xsl:if test="starts-with(config/OS, 'Windows')">
        <xsl:attribute name="style">background:yellow</xsl:attribute>
      </xsl:if>
      
      <td><xsl:value-of select="@nome" /></td> <!-- Muestra el valor del atributo 'nome' como contenido de la celda -->
      <td><xsl:value-of select="hardware/tipo" /></td> <!-- Muestra el valor del elemento 'hardware/tipo' como contenido de la celda -->
      <td><xsl:value-of select="config/OS" /></td> <!-- Muestra el valor del elemento 'config/OS' como contenido de la celda -->
      
      <td>
      <!--Al hacerlo asi solo se aplica a la fila qeu creamos en especifico-->
        <xsl:choose>
          <!-- Si la suma de la capacidad de los discos es mayor o igual a 1000, agrega el atributo 'style' con el valor 'color:red' -->
          <xsl:when test="sum(hardware/disco/@capacidade) &gt;= 1000">
            <xsl:attribute name="style">color:red</xsl:attribute>
          </xsl:when>
          <!-- Si la suma de la capacidad de los discos es mayor o igual a 500, agrega el atributo 'style' con el valor 'color:#FF4500' -->
          <xsl:when test="sum(hardware/disco/@capacidade) &gt;= 500">
            <xsl:attribute name="style">color:#FF4500</xsl:attribute>
          </xsl:when>
          <!-- En caso contrario, agrega el atributo 'style' con el valor 'color:orange' -->
         <xsl:otherwise>
            <xsl:attribute name="style">color:orange</xsl:attribute>
      </xsl:otherwise>
      </xsl:choose>
 <!-- Muestra la suma de la capacidad de los discos seguida de 'GB' como contenido de la celda -->
    <xsl:value-of select="sum(hardware/disco/@capacidade)" /> GB
  </td>
  
</xsl:element>
</xsl:template>

</xsl:stylesheet>
