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
        <div id="encabezado">
            <h1>
                <a href="{ite/@web}">
                <xsl:value-of select="ite/@nombre"/>
                </a>
            </h1>
        </div>

        <div id="cuerpo">
            
            <img id="imagen" src="img/photo01.jpeg" alt="Estudiante"  />
           
            <h2>Personal docente</h2>
            <!--Utilizamos las etiquetas details para introducir la información en desplegables-->
            <details>
            <summary>Director</summary>
                <p>
                Nombre: <xsl:value-of select="ite/director/nombre"/><br/>
                Despacho: <xsl:value-of select="ite/director/despacho"/>
                </p>
            </details>

            <details>
            <summary>Jefe de Estudios</summary>
                <p>
                Nombre: <xsl:value-of select="ite/jefe_estudios/nombre"/><br/>
                Despacho: <xsl:value-of select="ite/jefe_estudios/despacho"/>
                </p>
            </details>
            
            <details>
            <summary>Profesores</summary>
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
            </details>
            
            <h2>Oferta educativa</h2>
            <!--Utilizamos la etiqueta details para introducir la tabla en desplegable-->
            <details>
            <summary>Ciclos</summary>   
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
            </details>   

            <!--Formulario-->
            <section>
                <h2>Contacto</h2>
                <p>Información sin compromiso</p>
                    <form>
                        <label for="nombre">Nombre:  </label>
                        <input type="text" id="nombre" name="nombre" pattern="[A-Za-zñÑ]+" required="required" /><br />

                        <label for="apellido">Apellido:  </label>
                        <input type="text" id="apellido" name="apellido" pattern="[A-Za-zñÑ]+" required="required" /><br />
                        
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
        </div>

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

