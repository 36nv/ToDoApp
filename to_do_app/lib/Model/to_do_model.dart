class ToDoModel {
  int? id;
  String? created_at;
  String? TodoText;
  bool? isItdone;

  ToDoModel({
    this.id,
    this.created_at,
    this.TodoText,
    this.isItdone,
  });

  ToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    created_at = json['created_at'];
    TodoText = json['TodoText'];
    isItdone = json['isItdone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['created_at'] = created_at;
    data['TodoText'] = TodoText;
    data['isItdone'] = isItdone;
    return data;
  }
}
