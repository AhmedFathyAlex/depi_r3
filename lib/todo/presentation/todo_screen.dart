import 'package:depi_flutter/todo/data/auth_service.dart';
import 'package:depi_flutter/todo/presentation/task_item.dart';
import 'package:depi_flutter/todo/data/task_model.dart';
import 'package:depi_flutter/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskModel> tasks = [];
  var title = TextEditingController();
  var subTitle = TextEditingController();
  var date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Screen'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            AuthService.logout();
            Navigator.pushReplacementNamed(context, '/login');
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return TaskItem(task: tasks[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit_outlined),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                width: double.infinity,
                color: Colors.amber,
                child: Column(
                  children: [
                    CustomTextField(label: 'Title', controller: title),
                    CustomTextField(label: 'subtitle', controller: subTitle),
                    CustomTextField(
                      label: 'date',
                      controller: date,
                      onClick: () {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime.now().add(Duration(days: 365)),
                        ).then((selectedDate) {
                          // date.text = selectedDate.   ?? '';
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        var model = TaskModel(
                          title: title.text,
                          subtitle: subTitle.text,
                        );
                        setState(() {
                          tasks.add(model);
                        });
                        title.clear();
                        subTitle.clear();
                        Navigator.pop(context); // remove bottom sheet
                      },
                      child: Text('Create Task'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

}


