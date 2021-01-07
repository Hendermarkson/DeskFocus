class Task {
  String id;
  String name;
  bool isFinished;

  Task({this.name, this.isFinished = false}) {
    // TODO Generate random id
    this.id = this.name;
  }
}
