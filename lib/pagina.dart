class Pag {
  String id;
  String title;
  String contenido;

  Pag(this.id, this.title, this.contenido);

  Pag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    contenido = json['contenido'];
  }
}