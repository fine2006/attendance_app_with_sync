import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/components/subject_viewer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ColorScheme theme = Theme.of(context).colorScheme;
    const subjects = <String>[
      "Hindi",
      "English",
      "Maths",
      "Science",
      "Social Science",
    ];
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: theme.inversePrimary,
        title: Text(widget.title),
        actions: [Icon(Icons.account_circle)],
        actionsPadding: EdgeInsetsGeometry.all(10),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          int columns = (constraints.maxWidth / 300).floor();
          if (columns == 0) columns = 1;
          return subjects.isEmpty
              ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle,
                      size: 250,
                      color: theme.onInverseSurface,
                    ),
                    Text(
                      "Add a subject",
                      style: TextStyle(
                        fontSize: 50,
                        color: theme.onInverseSurface,
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                itemCount: 20,
                itemExtent: 300,
                shrinkWrap: false,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SubjectViewer(
                    subject: subjects[index % 5],
                    bgColor: theme.secondaryContainer,
                    borderColor: theme.secondary,
                  );
                },
              );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/newSubject');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
