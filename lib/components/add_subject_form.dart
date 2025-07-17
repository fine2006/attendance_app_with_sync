import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as drift;
import 'package:attendance_app_with_sync/database/database.dart';
import 'package:reactive_forms/reactive_forms.dart';

class AddSubjectForm extends StatefulWidget {
  final AppDatabase database;
  const AddSubjectForm({super.key, required this.database});

  @override
  State<AddSubjectForm> createState() => _AddSubjectFormState();
}

class _AddSubjectFormState extends State<AddSubjectForm> {
  late final _form = FormGroup({
    'name': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(2),
        Validators.maxLength(32),
      ],
      asyncValidators: [UniqueSubjectValidator(widget.database)],
    ),
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return ReactiveForm(
      formGroup: _form,
      child: Padding(
        padding: EdgeInsetsGeometry.all(20),
        child: Column(
          children: <Widget>[
            ReactiveTextField<String>(
              key: const Key('name'),
              formControlName: 'name',
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter name of subject',
              ),
              validationMessages: {
                ValidationMessage.required:
                    (error) => 'Subject name cannot be empty',
                ValidationMessage.minLength:
                    (error) =>
                        'Subject name must be between 2 and 32 characters',
                ValidationMessage.maxLength:
                    (error) =>
                        'Subject name must be between 2 and 32 characters',
              },
            ),
            SizedBox(height: 32),
            ReactiveFormConsumer(
              key: const Key('submit'),
              builder:
                  (context, form, _) => ElevatedButton.icon(
                    onPressed:
                        _form.valid
                            ? () => _onSubmit(
                              context,
                              _form.control('name').value.toString(),
                              widget.database,
                              form,
                            )
                            : null,
                    label: const Text("Add Subject"),
                    icon: const Icon(Icons.add),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.secondary,
                      foregroundColor: theme.onSecondary,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class UniqueSubjectValidator extends AsyncValidator<dynamic> {
  final AppDatabase database;
  UniqueSubjectValidator(this.database);
  @override
  Future<Map<String, dynamic>?> validate(AbstractControl control) async {
    final error = {'This subject already exists': false};
    final bool checkUnique = await database.exists(control.value.toString());
    if (checkUnique) {
      control.markAsTouched();
      return error;
    }
    return null;
  }
}

void _onSubmit(
  context,
  String subName,
  AppDatabase database,
  FormGroup form,
) async {
  await database.addSubject(
    SubjectCompanion(
      name: drift.Value<String>(subName),
      presentDays: drift.Value<int>(0),
      absentDays: drift.Value<int>(0),
    ),
  );
  if (context.mounted) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Subject $subName has been added")));
  }
  form.control('name').value = null;
}
