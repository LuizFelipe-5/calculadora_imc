import 'package:flutter/material.dart';
import 'package:imc/models/task_model.dart';

class CustomListView extends StatefulWidget {
  const CustomListView({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<TaskModel> tasks;

  @override
  _CustomListViewState createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: widget.tasks.length,
        itemBuilder: (context, index) {
          var task = widget.tasks[index];
          return Dismissible(
            onDismissed: (value) {
              widget.tasks.removeAt(index);
            },
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Theme.of(context).disabledColor,
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.centerLeft,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            key: UniqueKey(),
            child: Card(
              child: CheckboxListTile(
                title: Text(task.title),
                value: task.isCompleted,
                activeColor: Theme.of(context).primaryColor,
                secondary: Icon(
                  task.isCompleted ? Icons.check_circle : Icons.error,
                  color: Theme.of(context).primaryColor,
                ),
                onChanged: (value) {
                  widget.tasks[index].isCompleted = value!;

                  setState(() {});
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
