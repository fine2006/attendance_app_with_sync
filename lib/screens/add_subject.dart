import 'package:flutter/material.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({super.key});

  @override
  Widget build(BuildContext context) {
    //ColorScheme theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add a Subject")),
        body: Padding(
          padding: EdgeInsetsGeometry.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter name of subject',
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Add Subject"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
