import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search/note.dart';
import 'package:search/pagina.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/page': (context) => Pagina('1','titulo2')
    },
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Tutorial PHP'),
      ),
      body: HomePage(),
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> _notes = List<Note>();
  List<Note> _notesForDisplay = List<Note>();

  Future<List<Note>> fetchNotes() async {
    var response = await rootBundle.loadString('assets/json/php.json');
    var notes = List<Note>();
    var notesJson = json.decode(response);
    for (var noteJson in notesJson) {
      notes.add(Note.fromJson(noteJson));
    }
    return notes;
  }

  @override
  void initState() {
    fetchNotes().then((value) {
      setState(() {
        _notes.addAll(value);
        _notesForDisplay = _notes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return index == 0 ? _searchBar() : _listItem(index - 1);
      },
      itemCount: _notesForDisplay.length + 1,
    );
  }

  _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(hintText: 'Buscar Tutorial'),
        onChanged: (text) {
          text = text.toLowerCase();
          setState(() {
            _notesForDisplay = _notes.where((note) {
              var noteTitle = note.title.toLowerCase();
              return noteTitle.contains(text);
            }).toList();
          });
        },
      ),
    );
  }

  _listItem(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundImage: AssetImage("assets/json/logo1.png"),
          ),
          title: Text(_notesForDisplay[index].title),
          subtitle: Text(_notesForDisplay[index].subtitle),
          onTap: () {
            Navigator.pushNamed(context, '/page', arguments: PaginaArguments(_notesForDisplay[index].id, _notesForDisplay[index].title));
          },
        ),
      ),
    );
  }
}

class PaginaArguments {
  final String id;
  final String title;

  PaginaArguments(this.id, this.title);
}
