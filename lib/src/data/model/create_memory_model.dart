class CreateMemoryModel {
  const CreateMemoryModel({
    required this.title,
    required this.description,
    required this.date,});

  final String title;
  final String description;
  final DateTime date;

  Map<String, dynamic> toJson() {
    final createMap = <String, dynamic>{};
    createMap['title'] = title;
    createMap['description'] = description;
    createMap['date'] = date.toIso8601String();
    return createMap;
  }

}
