import 'package:attendance_app_with_sync/database/database.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubjectScreen extends StatefulWidget {
  final SubjectData subject;
  const SubjectScreen({super.key, required this.subject});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    Stream<SubjectData> subject = database.getData(widget.subject.id);
    ColorScheme theme = Theme.of(context).colorScheme;
    TextStyle? tStyleAppHeading = Theme.of(context).textTheme.titleLarge;
    TextStyle tStyleHeading = TextStyle(fontSize: 50);
    ButtonStyle eButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: theme.onSecondary,
      backgroundColor: theme.secondary,
    );

    void incPre(SubjectData subj) {
      SubjectCompanion updatedSubject = subj
          .toCompanion(true)
          .copyWith(presentDays: drift.Value(subj.presentDays + 1));
      database.updateSubject(updatedSubject);
    }

    void decPre(SubjectData subj) {
      int updatedValue = subj.presentDays == 0 ? 0 : subj.presentDays - 1;
      SubjectCompanion updatedSubject = subj
          .toCompanion(true)
          .copyWith(presentDays: drift.Value(updatedValue));
      database.updateSubject(updatedSubject);
    }

    void incAbs(SubjectData subj) {
      SubjectCompanion updatedSubject = subj
          .toCompanion(true)
          .copyWith(absentDays: drift.Value(subj.absentDays + 1));
      database.updateSubject(updatedSubject);
    }

    void decAbs(SubjectData subj) {
      int updatedValue = subj.absentDays == 0 ? 0 : subj.absentDays - 1;
      SubjectCompanion updatedSubject = subj
          .toCompanion(true)
          .copyWith(absentDays: drift.Value(updatedValue));
      database.updateSubject(updatedSubject);
    }

    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: widget.subject,
              child: Material(
                type: MaterialType.transparency,
                child: Text(widget.subject.name, style: tStyleAppHeading),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StreamBuilder(
                stream: subject,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(
                          "Present: ${snapshot.data!.presentDays}",
                          style: tStyleHeading,
                        ),
                        Text(
                          "Absent: ${snapshot.data!.absentDays}",
                          style: tStyleHeading,
                        ),
                        Text(
                          "Attendance: ${((snapshot.data!.absentDays + snapshot.data!.presentDays == 0) ? 0 : snapshot.data!.presentDays * 100 / (snapshot.data!.presentDays + snapshot.data!.absentDays)).truncate()}%",
                          style: tStyleHeading,
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
              StreamBuilder(
                stream: subject,
                builder: (context, snapshot) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 15,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => incPre(snapshot.data!),
                              style: eButtonStyle,
                              label: Text("Add Present"),
                              icon: Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => decPre(snapshot.data!),
                              style: eButtonStyle,
                              label: Text("Remove Present"),
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ),
                      IntrinsicWidth(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 15,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () => incAbs(snapshot.data!),
                              style: eButtonStyle,
                              label: Text("Add Absent"),
                              icon: Icon(Icons.add),
                            ),
                            ElevatedButton.icon(
                              onPressed: () => decAbs(snapshot.data!),
                              style: eButtonStyle,
                              label: Text("Remove Absent"),
                              icon: Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
