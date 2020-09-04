import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class Pagina extends StatelessWidget {
  final String num;

  Pagina(this.num);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Titulo'),
        ),
        body: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/json/$num.json"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var showData = json.decode(snapshot.data.toString());
                return ListView(
                  children: <Widget>[
                    HtmlWidget(
                      showData['contenido'],
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