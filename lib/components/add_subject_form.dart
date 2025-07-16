import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:provider/provider.dart';
import 'package:attendance_app_with_sync/database/database.dart';

class AddSubjectForm extends StatefulWidget {
  const AddSubjectForm({super.key});

  @override
  State<AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  final _formkey = GlobalKey<FormState>();
  final formController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    formController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    ColorScheme theme = Theme.of(context).colorScheme;
    bool dupSubject = false;

    void submit() async {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();

        FocusScope.of(context).requestFocus(FocusNode());

        final currentSubjectStatus = await database.search(formController.text);
        setState(() {
          if (currentSubjectStatus) {
            dupSubject = true;
          }
        });
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Subject ${formController.text} added succesfully"),
            ),
          );
        }
        database.addSubject(
          SubjectCompanion(
            name: drift.Value(formController.text),
            absentDays: drift.Value(0),
            presentDays: drift.Value(0),
          ),
        );
        formController.clear();
      }
    }

    _formkey.currentState?.validate();

    return Form(
      key: _formkey,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of subject',
              ),
              controller: formController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Subject name cannot be empty";
                } else if (value.length > 32 || value.length < 2) {
                  return "The subject name must be at least 2 characters and at most 32 characters";
                } else if (!dupSubject) {
                  return "This subject already exists";
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: () => submit(),
              label: const Text("Add Subject"),
              icon: const Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.secondary,
                foregroundColor: theme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
