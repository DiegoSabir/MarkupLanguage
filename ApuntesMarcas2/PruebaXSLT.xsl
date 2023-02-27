<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<!-- <xsl:output method="xml|html|text" ; por defecto es xml -->
	<xsl:output encoding="UTF-8" method="html"/>
	<!-- Indicas donde vas a empezar a trabajar;	/ : indica la raiz, es decir el principio de todo -->
	<xsl:template match="/">
		<html>
			<head>
				<title>Cartelera</title>  
			</head>
			<body>
				<h2>Peliculas</h2>
				<table border="1">
					<tr bgcolor="#a0a0ff">
						<th>Titulo</th>
						<th>Estreno</th>
						<th>Genero</th>
						<th>Duracion</th>
						<th>Procedenia</th>
						<th>Horarios</th>
					</tr> 
					<xsl:for-each select="catalogo/pelicula">
						<!-- order="ascending" / order="descending" -->
						<!-- case-order="upper-first" / case-order="lower-first" -->
						<xsl:sort select="estreno" order="ascending"/>
						<tr>
							<td>
								<xsl:value-of select="@titulo"/>
							</td>
							<!--Mayor:	&gt;	a &gt;10 -->
							<!--Menor:	&lt;	a &lt;10 -->
							<!--Mayor/Igual &gt;=	a &gt;=10-->
							<!--Menor/Igual &lt;=	a &lt;?10-->
							<xsl:if test = "estreno &lt; 2023">
								<td style="color:blue">
									<xsl:value-of select="estreno"/>
								</td>
							</xsl:if>
							<xsl:if test = "estreno = 2023">
								<td style="color:green">
									<xsl:value-of select="estreno"/>
								</td>
							</xsl:if>
							<xsl:if test = "estreno &gt; 2023">
								<td style="color:red">
									<xsl:value-of select="estreno"/>
								</td>
							</xsl:if>
							<td>
								<xsl:value-of select="genero"/>
							</td>
							<td>
								<xsl:value-of select="duracion"/> minutos
							</td>
							<td>
								<xsl:choose>
									<xsl:when test="origen='España'">Nacional</xsl:when>
									<xsl:otherwise>Extranjera</xsl:otherwise>
								</xsl:choose>
							</td>
							<td>
							  <ul>
                  <li><xsl:value-of select="horario/*"/></li>
							  </ul>
							</td>
						</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
    </xsl:template>
</xsl:stylesheet>