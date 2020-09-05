class Note {
  String id;
  String title;
  String subtitle;

  Note(this.id, this.title, this.subtitle);

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    subtitle = json['subtitle'];
  }
}