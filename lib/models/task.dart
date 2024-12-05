class Task {
  int? id;
  String title;
  String type;
  String regDate;
  String regDateFa;
  String? doneDateFa;

  Task({
    this.id,
    required this.title,
    required this.type,
    required this.regDate,
    required this.regDateFa,
    this.doneDateFa,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        regDate: json['regDate'],
        regDateFa: json['regDateFa'],
        doneDateFa: json['doneDateFa'],
      );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'regDate': regDate,
      'regDateFa': regDateFa,
    };
  }

  Map<String, dynamic> toMapUpdate() {
    return {
      'id': id,
      'title': title,
      'type': type,
      'regDate': regDate,
      'regDateFa': regDateFa,
      'doneDateFa': doneDateFa,
    };
  }
}
