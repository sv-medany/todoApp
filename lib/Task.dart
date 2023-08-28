class Task{
  bool isdone;
  String title;
  String description;
  int date;
  String id;
  Task({ this.id='',required this.title, required this.description , required this.date, this.isdone=false});
  Map<String,dynamic>toJson() {
    return {
      "id": id,
      "title": title,
      "isdone": isdone,
      "description": description,
      "date": date,
    };
  }
      Task.fromJson(Map<String,dynamic> json):this(
            id:json["id"] as String,
          description:json["description"] as String,
          isdone:json["isdone"] as bool,
          title:json["title"] as String,
          date:json["date"] as int
        );

  }

