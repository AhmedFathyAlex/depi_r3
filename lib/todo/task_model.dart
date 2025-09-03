class TaskModel {
  final String title;
  final String subtitle;
  final DateTime date;
   bool isChecked;

  TaskModel({required this.title ,
   DateTime? date ,
    this.subtitle = '' , this.isChecked = false })
   : this.date = date ?? DateTime.now();

}