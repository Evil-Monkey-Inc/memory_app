/// muid : "f955722a-a735-41f6-9670-5f5917567fe4"
/// title : "Test Memory"
/// description : "This is a test memory"
/// date : "2023-06-04T02:53:12.510733Z"

class MemoryModel {
  MemoryModel({
    this.userId,
    this.muid,
    this.title,
    this.description,
    this.date,
  });

  factory MemoryModel.fromJson(Map<String, dynamic> json) {
    final userId = json['userId'];
    final muid = json['muid'];
    final title = json['title'];
    final description = json['description'];
    final date = json['date'];

    return MemoryModel(
      userId: userId,
      muid: muid,
      title: title,
      description: description,
      date: date,
    );
  }

  final String? userId;
  final String? muid;
  final String? title;
  final String? description;
  final DateTime? date;

  MemoryModel copyWith({
    String? userId,
    String? muid,
    String? title,
    String? description,
    DateTime? date,
  }) =>
      MemoryModel(
        userId: userId ?? this.userId,
        muid: muid ?? this.muid,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['muid'] = muid;
    map['title'] = title;
    map['description'] = description;
    map['date'] = date?.toIso8601String();
    return map;
  }

  @override
  String toString() => toJson().toString();
}
