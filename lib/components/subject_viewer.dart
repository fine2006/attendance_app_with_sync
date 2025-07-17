import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/screens/subject_screen.dart';
import 'package:attendance_app_with_sync/database/database.dart';

class SubjectViewer extends StatelessWidget {
  final Color? bgColor;
  final Color borderColor;
  final SubjectData subject;
  const SubjectViewer({
    super.key,
    required this.subject,
    this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextStyle? textStyle = Theme.of(context).textTheme.headlineLarge;
    return Container(
      margin: EdgeInsetsGeometry.all(10),
      decoration: BoxDecoration(
        color: bgColor,
        border: BoxBorder.fromLTRB(
          bottom: BorderSide(
            color: borderColor,
            width: 70,
            style: BorderStyle.solid,
          ),
        ),
        borderRadius: BorderRadiusGeometry.circular(20),
      ),
      padding: EdgeInsetsGeometry.all(10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubjectScreen(subject: subject),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      subtitle: Text("Present", textAlign: TextAlign.center),
                      title: Text(
                        "${subject.presentDays}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: theme.outline,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Expanded(
                    child: ListTile(
                      subtitle: Text("Absent", textAlign: TextAlign.center),
                      title: Text(
                        "${subject.absentDays}",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: theme.outline,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Expanded(
                    child: ListTile(
                      subtitle: Text("Percent", textAlign: TextAlign.center),
                      title: Text(
                        "${((subject.absentDays + subject.presentDays == 0) ? 0 : subject.presentDays * 100 / (subject.presentDays + subject.absentDays)).truncate()}%",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Hero(
              tag: subject,
              child: Material(
                type: MaterialType.transparency,
                child: Text(
                  subject.name.toString(),
                  style: textStyle,
                  //textAlign: TextAlign.start,
                  //softWrap: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
