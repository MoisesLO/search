import 'package:flutter/material.dart';

class pageTutorial extends StatefulWidget {
  @override
  _pageTutorialState createState() => _pageTutorialState();
}

class _pageTutorialState extends State<pageTutorial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
      body: Text('id : cuerpo'),
    );
  }
}
