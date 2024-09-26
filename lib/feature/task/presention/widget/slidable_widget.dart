import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class SlidableWidget extends StatelessWidget {
  final Widget child;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? editFunction;

  const SlidableWidget(
      {super.key,
        required this.child,
        required this.deleteFunction,
        required this.editFunction});

  @override
  Widget build(BuildContext context) {
    return Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
            SlidableAction(
              onPressed: editFunction,
              backgroundColor: const Color(0xFF21B7CA),
              foregroundColor: Colors.white,
              icon: Icons.edit,
              label: 'Edit',
            ),
          ],
        ),
        child: child);
  }
}
