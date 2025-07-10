import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/components/subject_viewer.dart';
import 'package:dynamic_color/dynamic_color.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightColorScheme, darkColorScheme) {
        return MaterialApp(
          title: 'Attendance Tracker',
          theme: ThemeData.from(
            colorScheme:
                lightColorScheme ??
                ColorScheme.fromSeed(seedColor: Colors.lightBlue),
          ),
          darkTheme: ThemeData.from(
            colorScheme:
                darkColorScheme ??
                ColorScheme.fromSeed(
                  seedColor: Colors.lightBlue,
                  brightness: Brightness.dark,
                ),
          ),
          themeMode: ThemeMode.system,
          home: const MyHomePage(title: 'Home'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: theme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
