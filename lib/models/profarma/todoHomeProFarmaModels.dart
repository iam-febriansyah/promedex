import 'dart:convert';

List<TodoHomeProFarma> todoFromJsonHomeProFarma(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TodoHomeProFarma>((dynamic json) => TodoHomeProFarma.fromJson(json)).toList();
}

class TodoHomeProFarma {
  String id;
  String title;
  String harga;
  String deskripsi;
  dynamic carapenggunaan;
  dynamic efeksamping;
  String image;

  TodoHomeProFarma({
    this.id,
    this.title,
    this.harga,
    this.deskripsi,
    this.carapenggunaan,
    this.efeksamping,
    this.image,
  });

  factory TodoHomeProFarma.fromJson(Map<String, dynamic> json) => TodoHomeProFarma(
        id: json['id'],
        title: json['title'],
        harga: json['harga'],
        deskripsi: json['deskripsi'],
        carapenggunaan: json['carapenggunaan'],
        efeksamping: json['efeksamping'],
        image: json['image'],
    );

    Map<String, dynamic> toJson() {
      final Map<String, String> map = {
            'id': id,
            'title': title,
            'harga': harga,
            'deskripsi': deskripsi,
            'carapenggunaan': carapenggunaan,
            'efeksamping': efeksamping,
            'image': image,
          };
      return map;
    }
}
