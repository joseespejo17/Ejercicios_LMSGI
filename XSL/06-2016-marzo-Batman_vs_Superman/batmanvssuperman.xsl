<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  
  <xsl:template match="/cine">
    <html>
      <head>
        <title>ArteOcho Lucena</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <xsl:attribute name="id">principal</xsl:attribute>
        <div style="width: 1000px; margin: 0 auto;">
          <h1><xsl:value-of select="@nombre"/></h1>
          <xsl:apply-templates select="titulo"></xsl:apply-templates>
          <xsl:apply-templates select="sesiones"></xsl:apply-templates>
          <br></br>
          <xsl:apply-templates select="cartelera"></xsl:apply-templates>
        </div>     
    
      </body>
    </html>
  </xsl:template>

  <xsl:template match="cartelera">
    <h1>Gran Cartelera de Estrenos</h1>
    <xsl:for-each select="pelicula">
      <xsl:variable name="titulo" select="@id"/>
      <img src="{/cine/imagenes/imagen[@id = $titulo]}"></img>
      <h2><xsl:value-of select="@nombre"/></h2>
    </xsl:for-each>
  </xsl:template>

  <xsl:template name="css">
    <style type="text/css">
      body {
      font-family: Arial;
      font-size: 12px;
      }
      #principal{
      text-align: center;
      }
    </style>
  </xsl:template>
  
 
  
  <xsl:template match="sesiones">
    <table align="center" border="1" width="100%">
      <xsl:for-each select="sesion">
        <tr>
          <xsl:if test="position() mod 2 = 1">
            <xsl:attribute name="style"> background: lightblue </xsl:attribute>
          </xsl:if>
          <td align="center"><p>Sesion <xsl:value-of select="position()"/> : <xsl:value-of select="@hora"/>
          </p>
            <table border="1" width="50%" align="center">
              <xsl:call-template name="asientos"></xsl:call-template>
            </table>
          </td>
        </tr>  
      </xsl:for-each>
     
    </table>
  </xsl:template>
  
  <xsl:template name="asientos">
    <xsl:for-each select=".">
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i">1</xsl:with-param>
      </xsl:call-template>
      
    </xsl:for-each>
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 4">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/> 
    <xsl:if test="$j &lt;= 4">
      <xsl:call-template name="celda">
        <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
        <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
        <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  <!--  -->
  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td align="center">
      <xsl:choose>
        <xsl:when test="ocupado[$x = @asiento and $y = @fila]">
          <img src="{/cine/imagenes/imagen[@id = 'ocupado']}"></img>
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id = 'libre']}"></img>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>

  <!--  -->
  <xsl:template match="titulo">
   
    <img src="{imagen/.}" width="500px"></img>
    <h2><xsl:value-of select="@nombre"/></h2>
    <h3><xsl:value-of select="@estreno"/></h3>
   
  </xsl:template>



</xsl:stylesheet>
