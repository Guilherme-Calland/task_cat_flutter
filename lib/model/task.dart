class Task{
  int? id;
  String? name;

  Task(this.name);

  Task.mapToTask(Map rawData){
    this.id = rawData['id'];
    this.name = rawData['name'];
  }

  Map<String, dynamic> taskToMap(){
    Map<String, dynamic> rawData = {
      'name' : this.name,
    };

    if(this.id != null){
      rawData['id'] = this.id;
    }

    return rawData;
  }
}