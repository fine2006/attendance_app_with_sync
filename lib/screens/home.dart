import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/components/subject_viewer.dart';
import 'package:provider/provider.dart';
import 'package:attendance_app_with_sync/database/database.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<AppDatabase>(context);
    ColorScheme theme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //backgroundColor: theme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
          actionsPadding: EdgeInsetsGeometry.all(10),
        ),
        body: StreamBuilder<List<SubjectData>>(
          stream: database.allSubjects,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
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
              );
            } else {
              return LayoutBuilder(
                builder: (context, constraints) {
                  int columns = (constraints.maxWidth / 300).floor();
                  if (columns == 0) columns = 1;
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    //itemExtent: 300,
                    shrinkWrap: false,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      double percentage =
                          snapshot.data![index].presentDays *
                          100 /
                          (snapshot.data![index].presentDays +
                              snapshot.data![index].absentDays);
                      MaterialAccentColor borderColor =
                          (percentage >= 85)
                              ? Colors.greenAccent
                              : (percentage >= 75)
                              ? Colors.yellowAccent
                              : Colors.redAccent;
                      return SubjectViewer(
                        subject: snapshot.data![index],
                        bgColor: theme.secondaryContainer,
                        borderColor: borderColor,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newSubject');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
