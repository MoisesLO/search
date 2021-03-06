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
""";
