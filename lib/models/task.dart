class Task {
  int? id;
  String title;
  String? details;
  String category;
  String regDate;
  bool done;
  String? dateFA;
  String? time;
  bool favorite;
  bool archive;

  Task({
    this.id,
    required this.title,
    this.details,
    required this.category,
    required this.regDate,
    required this.done,
    this.dateFA,
    this.time,
    required this.favorite,
    required this.archive,
  });

  factory Task.fromMap(Map<String, dynamic> json) => Task(
        id: json['id'],
        title: json['title'],
        details: json['details'],
        category: json['category'],
        regDate: json['regDate'],
        done: json['done'] != 0 ? true : false,
        dateFA: json['dateFA'],
        time: json['time'],
        favorite: json['favorite'] != 0 ? true : false,
        archive: json['archive'] != 0 ? true : false,
      );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'details': details,
      'category': category,
      'regDate': regDate,
      'done': done ? 1 : 0,
      'dateFA': dateFA,
      'time': time,
      'favorite': favorite ? 1 : 0,
      'archive': archive ? 1 : 0,
    };
  }

  Map<String, dynamic> toMapUpdate() {
    return {
      'title': title,
      'details': details,
      'category': category,
      'regDate': regDate,
      'done': done ? 1 : 0,
      'dateFA': dateFA,
      'time': time,
      'favorite': favorite ? 1 : 0,
      'archive': archive ? 1 : 0,
    };
  }
}
