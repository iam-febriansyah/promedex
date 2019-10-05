import 'dart:convert';

List<TodoKlinik> todoFromJsonKlinik(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TodoKlinik>((dynamic json) => TodoKlinik.fromJson(json)).toList();
}

class TodoKlinik {
  String id;
  String nama;
  dynamic deskripsi;
  dynamic harga;
  String jenis;
  String alamat;
  String gambar;

  TodoKlinik({
    this.id,
    this.nama,
    this.deskripsi,
    this.harga,
    this.jenis,
    this.alamat,
    this.gambar,
  });

  factory TodoKlinik.fromJson(Map<String, dynamic> json) => TodoKlinik(
        id: json['id'],
        nama: json['nama'],
        deskripsi: json['deskripsi'],
        harga: json['harga'],
        jenis: json['jenis'],
        alamat: json['alamat'],
        gambar: json['gambar'],
    );

    Map<String, dynamic> toJson() {
      final Map<String, String> map = {
            'id': id,
            'nama': nama,
            'deskripsi': deskripsi,
            'harga': harga,
            'jenis': jenis,
            'alamat': alamat,
            'gambar': gambar,
          };
      return map;
    }
}
