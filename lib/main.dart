import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:search/note.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
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
              var noteTitle = note.name.toLowerCase();
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
          leading: FlutterLogo(size: 56.0),
          title: Text('Two-line ListTile'),
          subtitle: Text(_notesForDisplay[index].username),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page()),
            );
          },
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo'),
      ),
    );
  }
}



// Card(
// child: Padding(
// padding: const EdgeInsets.only(
// top: 10.0, bottom: 15.0, left: 16.0, right: 16.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// _notesForDisplay[index].name,
// style: TextStyle(
// fontSize: 19,
// fontWeight: FontWeight.bold,
// color: Colors.grey.shade700),
// ),
// Padding(padding: EdgeInsets.only(top: 10)),
// Text(
// _notesForDisplay[index].username,
// style: TextStyle(color: Colors.grey.shade600),
// ),
// ],
// ),
// ),
// );