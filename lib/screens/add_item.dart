import 'package:bloc_test/model/color_description.dart';
import 'package:bloc_test/widgets/blocs/color_bloc/bloc.dart';
import 'package:bloc_test/widgets/blocs/list_of_descriptions/bloc.dart';
import 'package:bloc_test/widgets/color_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddColorDescriptionItem extends StatelessWidget {
  const AddColorDescriptionItem({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String title = "";
    String description = "";

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Add screen",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(children: [
              TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black),
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
                  title = newValue!;
                },
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black),
                decoration: const InputDecoration(label: Text("Description")),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1) {
                    return "Descreption input is invalid";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  description = newValue!;
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
                    ColorContainer(
                      color: Colors.purple,
                      nameOfColor: "purple",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ColorContainer(
                      color: Colors.black,
                      nameOfColor: "black",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 28,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ElevatedButton(
                  onPressed: () {
                    formKey.currentState!.reset();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text("Reset"),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    final currentColor =
                        context.read<ColorAnimationBloc>().state.color;
                    if (formKey.currentState!.validate() &&
                        currentColor != null) {
                      formKey.currentState!.save();
                      context.read<ColorDescriptionsBloc>().add(
                          ColorDescriptionsAddEvent(
                              addingElement: ColorDescription(
                                  color: currentColor,
                                  description: description,
                                  title: title,
                                  id: uuid.v4())));
                      context
                          .read<ColorAnimationBloc>()
                          .add(ColorAnimationUntoggledEvent());
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).clearSnackBars();
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 1),
                        content: const Text(
                          "Something went wrong!",
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  child: const Text("Submit"),
                )
              ])
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