import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Pagina extends StatelessWidget {
  final String id;
  final String title;

  Pagina(this.id, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/json/$id.json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var showData = json.decode(snapshot.data.toString());
                return ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: HtmlWidget(
                        showData['contenido'],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                    )
                  ],
                );
              } else {
                return Text('Cargando ...');
              }
            }));
  }
}

const html = """ 
<div>
<p>Actualmente XAMPP es el entorno más popular de desarrollo con PHP. Este software contiene todo lo que necesitamos para probar en forma local en nuestro equipo los programas que codifiquemos en PHP.</p>

<p>Procedemos a descargar XAMPP de la siguiente página: <a target="_blank" href="https://www.apachefriends.org/es/index.html">aquí</a>.</p><p> 
<img src="asset://assets/img/2_phpya1.jpg" border="0" alt="instalación de XAMPP"><br>

</p><p>Luego de descargarlo procedemos a ejecutar el instalador:</p>
<img src="asset://assets/img/2_phpya2.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Seleccionamos los programas mínimos que necesitamos para trabajar con PHP, MySQL, Apache y phpMyAdmin:</p>
<img src="asset://assets/img/2_phpya3.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Elegimos el directorio donde se instalará":</p>
<img src="asset://assets/img/2_phpya4.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Luego comienza la instalación propiamente del software:</p>
<img src="asset://assets/img/2_phpya5.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Una vez finalizada la instalación aparece un diálogo con un 'checkbox' para iniciar el programa XAMPP inmediatamente:</p>
<img src="asset://assets/img/2_phpya6a.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Si dejamos chequeada la opción "Do you want to start the Control Panel now?" se inicia el XAMPP</p>
<img src="asset://assets/img/2_phpya6.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Debemos iniciar los programas "Apache" y "MySQL" presionando los botones 'Start':</p>
<img src="asset://assets/img/2_phpya7.jpg" border="0" alt="instalación de XAMPP"><br>
<p>Si el software está correctamente instalado y no hay conflicto con otros deberán aparecer en verde los paneles de estado.</p>
<p>Siempre que codifiquemos y probemos los programas en PHP el programa XAMPP junto con 'Apache' y 'MySQL' deben estar ejecutandose.</p>
<p>En el escritorio aparece un ícono del panel de control de XAMPP o podemos arrancarlo desde el directorio donde lo instalamos mediante el programa:</p>
<img src="asset://assets/img/2_phpya8.jpg" border="0" alt="instalación de XAMPP"><br>
<p>El siguiente paso es probar nuestro primer programa en PHP.</p>

<h3>Acotaciones</h3>
<p>Existe otro entorno popular llamado WAMPSERVER que nos instala y administra PHP, MySQL y Apache.</p>
<p>Si ya lo tiene instalado y ya está habituado a trabajar con él, no es necesario que instale el XAMPP.</p>
<p>El entorno de WAMPSERVER lo puede descargar del sitio: 
<a target="_blank" href="http://www.wampserver.com/en/">WAMPSERVER</a>.</p>
</div>
""";
