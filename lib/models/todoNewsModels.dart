import 'dart:convert';

List<TodoNews> todoFromJsonNews(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TodoNews>((dynamic json) => TodoNews.fromJson(json)).toList();
}

class TodoNews {
  final String id;
  final String judul;
  final String isi;
  final String gambar;

  TodoNews({
    this.id,
    this.judul,
    this.isi,
    this.gambar,
  });

  factory TodoNews.fromJson(Map<String, dynamic> json) => TodoNews(
        id: json['id'],
        judul: json['judul'],
        isi: json['isi'],
        gambar: json['gambar'],
    );

    Map<String, dynamic> toJson() {
      final Map<String, String> map = {
              'id': id,
              'judul': judul,
              'isi': isi,
              'gambar': gambar,
          };
      return map;
    }
}
