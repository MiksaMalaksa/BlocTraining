import 'package:bloc_test/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/color_description.dart';
import '../widgets/blocs/list_of_descriptions/bloc.dart';

class AddColorDescriptionItem extends StatelessWidget {
  AddColorDescriptionItem({super.key});

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _descreption = "";

  void _dummyAdd(BuildContext context) {
    context.read<ColorDescriptionsBloc>().add(
          ColorDescriptionsAddEvent(
            addingElement: ColorDescription(
                color: Colors.amber,
                description: "s",
                title: "Oj",
                id: uuid.v4()),
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Add screen"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                decoration:
                    const InputDecoration(label: Text("Write the title")),
                maxLength: 20,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Title input is invalid";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _title = newValue!;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSecondary),
                decoration: const InputDecoration(label: Text("Descreption")),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Descreption input is invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 28,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ColorContainer(
                      color: Colors.red,
                      nameOfColor: "red",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ColorContainer(
                      color: Colors.green,
                      nameOfColor: "green",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ColorContainer(
                      color: Colors.blue,
                      nameOfColor: "blue",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}


// Center(
//         child: ElevatedButton(
//           child: const Text("Dummy add check"),
//           onPressed: () => _dummyAdd(context),
//         ),
//       ),

// !-_-_- [get it, di] -_-_-!