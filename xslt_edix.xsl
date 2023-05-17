<?xml version="1.0" encoding="UTF-8"?>

<!--Utilizamos el siguiente namespace, nodo raiz de todos los ficheros xslt-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Nos situamos en el nodo raiz-->
    <xsl:template match="/">

<!--Escribimos lo que queremos generar, en este caso HTML-->
        <html>
        <head>
            <title>Edix</title>
            <!--Añadimos el fichero CSS-->
            <link rel="stylesheet" href="css/estilos.css" />
        </head>
        <body>
            <h1><xsl:value-of select="ite/empresa"/></h1>

            <h2>Profesores</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Nombre</th>
                </tr>
            </thead>
            <tbody>
               <xsl:for-each select="ite/profesores/profesor">
               <tr>
                    <td><xsl:value-of select="id"/></td>
                    <td><xsl:value-of select="nombre"/></td>
               </tr>
               </xsl:for-each>
            </tbody>
        </table>

            <h2>Ciclos</h2>
        <table border="1">
            <thead>
                <tr>
                    <th>id</th>
                    <th>Nombre</th>
                    <th>Grado</th>
                    <th>Decreto Título</th>
                </tr>
            </thead>
            <tbody>
               <xsl:for-each select="ite/ciclos/ciclo">
               <tr>
                    <td><xsl:value-of select="@id"/></td>
                    <td><xsl:value-of select="nombre"/></td>
                    <td><xsl:value-of select="grado"/></td>
                    <td><xsl:value-of select="decretoTitulo/@año"/></td>
               </tr>
               </xsl:for-each>
            </tbody>
        </table>
        </body>
        </html>
        





    </xsl:template>
</xsl:stylesheet>

