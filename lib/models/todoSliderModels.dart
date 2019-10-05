import 'dart:convert';

List<TodoSlider> todoFromJsonSlider(String responseBody) {
  final dynamic parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<TodoSlider>((dynamic json) => TodoSlider.fromJson(json)).toList();
}

class TodoSlider {
  final String id;
  final String title;
  final String description;
  final String imageUrl;

  TodoSlider({
    this.id,
    this.title,
    this.description,
    this.imageUrl,
  });

  factory TodoSlider.fromJson(Map<String, dynamic> json) => TodoSlider(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['image_url'],
    );

    Map<String, dynamic> toJson() {
      final Map<String, String> map = {
              'id': id,
              'title': title,
              'description': description,
              'image_url': imageUrl,
          };
      return map;
    }
}
