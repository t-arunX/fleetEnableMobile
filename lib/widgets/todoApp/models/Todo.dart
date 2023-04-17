class Todo {
  int? id;
  String? text;
  int? state;
  int? todoId;

  // Todo({required this.id, required this.text, required this.state});

  Map<String, dynamic> toMap() =>
      {'id': id, 'text': text, 'state': state, 'todoId': todoId};
}
