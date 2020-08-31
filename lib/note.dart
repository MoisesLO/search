class Note {
  String name;
  String username;

  Note(this.name, this.username);

  Note.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    username = json['username'];
  }
}