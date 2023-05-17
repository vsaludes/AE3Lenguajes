<?xml version="1.0" encoding="UTF-8"?>

<!--Utilizamos el siguiente namespace, nodo raiz de todos los ficheros xslt-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<!--Nos situamos en el nodo raiz-->
    <xsl:template match="/">

<!--Escribimos lo que queremos generar, en este caso HTML-->
        <html>
        <head>
            <title><xsl:value-of select="ite/@nombre"/></title>
            <!--Añadimos el fichero CSS-->
            <link rel="stylesheet" href="css/estilos.css" />
        </head>
        <body>
            <!--Añadimos como hipervínculo la dirección web que contiene el atributo web al atributo nombre-->
            <h1>
                <a href="{ite/@web}">
                <xsl:value-of select="ite/@nombre"/>
                </a>
            </h1>

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

        <section>
          <h2>Director</h2>
          <p>
            Nombre: <xsl:value-of select="ite/director/nombre"/><br/>
            Despacho: <xsl:value-of select="ite/director/despacho"/>
          </p>
        </section>

        <section>
          <h2>Jefe de Estudios</h2>
          <p>
            Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/><br/>
            Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/>
          </p>
        </section>

        <section>
            <h2>Contacto</h2>
                <form>
                    <label for="nombre">Nombre:  </label>
                    <input type="text" id="nombre" name="nombre" pattern="[A-Za-zñÑ]+" required="required" /><br />
                    
                    <label for="telefono">Teléfono: </label>
                    <input type="tel" id="telefono" name="telefono" pattern="[0-9]*" minlength="9" maxlength="9" required="required" /><br />
                    
                    <label for="opciones">Ciclo:</label>
                        <select id="opciones" name="opciones" required="required">
                        <option value="asir">ASIR</option>
                        <option value="daw">DAW</option>
                        <option value="dam">DAM</option>
                        <option value="no_lo_se">No lo sé</option>
                        </select> <br />
                    
                    <input type="submit" value="Enviar" />
                </form>
        </section>

    <!--Pie de página que contiene una lista desordenada con la información de la empresa-->
        <footer>
            <ul>
                <li><xsl:value-of select="ite/empresa"/></li>
                <li><xsl:value-of select="ite/telefono"/></li>
                <li><a href="https://www.grupoproeduca.com/">Web grupo Proeduca</a></li>
            </ul>
        </footer>
        </body>
        </html>
        





    </xsl:template>
</xsl:stylesheet>

