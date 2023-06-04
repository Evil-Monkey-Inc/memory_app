/// uuid : "f955722a-a735-41f6-9670-5f5917567fe4"
/// title : "Test Memory"
/// description : "This is a test memory"
/// date : "2023-06-04T02:53:12.510733Z"

class MemoryModel {
  MemoryModel({
    required this.uuid,
    required this.title,
    required this.description,
    required this.date,
  });

  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    final uuid = json['uuid'];
    final title = json['title'];
    final description = json['description'];
    final date = json['date'];

    return MemoryModel(
      uuid: uuid,
      title: title,
      description: description,
      date: date,
    );
  }

  final String? uuid;
  final String? title;
  final String? description;
  final String? date;

  MemoryModel copyWith({
    String? uuid,
    String? title,
    String? description,
    String? date,
  }) =>
      MemoryModel(
        uuid: uuid ?? this.uuid,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uuid'] = uuid;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date;
    return map;
  }

  @override
  String toString() => toJson().toString();
}
