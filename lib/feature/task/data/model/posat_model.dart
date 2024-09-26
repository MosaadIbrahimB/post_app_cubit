class TaskModel {
  String id;
  String title;
  String desc;
  int date;
  bool status;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.desc,
      required this.date,
      required this.status});

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(

      id: json["id"],
      title: json["title"],
      desc: json["desc"],
      date: json["date"],
      status: json["status"]);

  Map<String, dynamic> toJson() =>
      {"id": id,"title": title,
        "desc": desc, "date": date, "status": status};
}
