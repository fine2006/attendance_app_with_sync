import 'package:flutter/material.dart';

class SubjectScreen extends StatefulWidget {
  final String subject;
  const SubjectScreen({super.key, required this.subject});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    TextStyle? tStyleAppHeading = Theme.of(context).textTheme.titleLarge;
    TextStyle tStyleHeading = TextStyle(fontSize: 50);
    ButtonStyle eButtonStyle = ElevatedButton.styleFrom(
      foregroundColor: theme.onSecondary,
      backgroundColor: theme.secondary,
    );
    return SafeArea(
      child: Material(
        type: MaterialType.transparency,
        child: Scaffold(
          appBar: AppBar(
            title: Hero(
              tag: widget.subject,
              child: Material(
                type: MaterialType.transparency,
                child: Text(widget.subject, style: tStyleAppHeading),
              ),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text("Present: 0", style: tStyleHeading),
                  Text("Absent: 0", style: tStyleHeading),
                  Text("Attendance: 0%", style: tStyleHeading),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IntrinsicWidth(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      spacing: 15,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: eButtonStyle,
                          label: Text("Add Present"),
                          icon: Icon(Icons.add),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
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
                          onPressed: () {},
                          style: eButtonStyle,
                          label: Text("Add Absent"),
                          icon: Icon(Icons.add),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {},
                          style: eButtonStyle,
                          label: Text("Remove Absent"),
                          icon: Icon(Icons.remove),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
