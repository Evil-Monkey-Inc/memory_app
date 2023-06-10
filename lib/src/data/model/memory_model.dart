/// muid : "f955722a-a735-41f6-9670-5f5917567fe4"
/// title : "Test Memory"
/// description : "This is a test memory"
/// date : "2023-06-04T02:53:12.510733Z"

class MemoryModel {
  const MemoryModel({
    required this.muid,
    required this.title,
    required this.description,
    required this.date,
  });

  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    final muid = json['muid'];
    final title = json['title'];
    final description = json['description'];
    final date = DateTime.parse(json['date']) ;

    return MemoryModel(
      muid: muid,
      title: title,
      description: description,
      date: date,
    );
  }

  final String muid;
  final String title;
  final String description;
  final DateTime date;

  MemoryModel copyWith({
    String? muid,
    String? title,
    String? description,
    DateTime? date,
  }) =>
      MemoryModel(
        muid: muid ?? this.muid,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['muid'] = muid;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date?.toIso8601String();
    return map;
  }

  @override
  String toString() => toJson().toString();
}
