import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app_with_sync/components/add_subject_form.dart';
import 'package:attendance_app_with_sync/database/database.dart';

class AddSubject extends StatelessWidget {
  const AddSubject({super.key});

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    final ColorScheme theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Add a Subject")),
        body: Column(
          children: [
            AddSubjectForm(),
            StreamBuilder<List<SubjectData>>(
              stream: database.allSubjects,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Container();
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    //itemExtent: 300,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(snapshot.data![index].name),
                            Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                        tileColor: theme.secondaryContainer,
                        textColor: theme.onSecondaryContainer,
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
