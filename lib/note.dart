class Note {
  String id;
  String name;
  String username;

  Note(this.id, this.name, this.username);

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }
}