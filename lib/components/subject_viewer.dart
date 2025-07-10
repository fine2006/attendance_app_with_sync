import 'package:flutter/material.dart';

class SubjectViewer extends StatelessWidget {
  final String subject;
  final Color? bgColor;
  final Color borderColor;
  const SubjectViewer({
    super.key,
    required this.subject,
    this.bgColor,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        print("$subject tapped");
      },
      child: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      title: Text("0", textAlign: TextAlign.center),
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
                      title: Text("0", textAlign: TextAlign.center),
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
                      title: Text("0%", textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              subject,
              style: TextStyle(fontSize: 30),
              textAlign: TextAlign.start,
              softWrap: true,
            ),
          ],
        ),
      ),
    );
  }
}
