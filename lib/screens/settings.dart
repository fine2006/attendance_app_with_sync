import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/database/database.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> menuTitles = <String>[
    "Yellow Threshold",
    "Red Threshold",
    "Clear All Subjects",
  ];
  final List<String> menuDesc = <String>[
    "The percentage at which the subject is marked with yellow",
    "The percentage at which the subject is marked with red",
    "Reset all settings, and delete all subjects",
  ];
  List<bool> isSlider = <bool>[true, true, false];
  List<double> sliderValue = <double>[0, 0, 0];
  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    final List menuFunc = [
      () {
        null;
      },
      () {
        null;
      },
      () {
        final superContext = context;
        showDialog(
          context: superContext,
          builder: (BuildContext dialogContext) {
            return AlertDialog(
              content: Text(
                "This will delete all subjects and their attendance, are you sure?",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(dialogContext).pop();
                    await database.clearAllSubjects();
                    if (superContext.mounted) {
                      ScaffoldMessenger.of(superContext).showSnackBar(
                        SnackBar(content: Text("Deleted all subjects!")),
                      );
                      Navigator.pop(superContext);
                    }
                  },
                  child: Text("Confirm"),
                ),
              ],
            );
          },
        );
      },
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: Column(
        children: [
          SizedBox(height: 10),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(menuTitles[0]),
                Text('${sliderValue[0].truncate()}'),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(menuDesc[0], softWrap: true),
                (Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue[0],
                  onChanged: (value) {
                    setState(() {
                      sliderValue[0] =
                          (value <= sliderValue[1]) ? sliderValue[1] : value;
                    });
                  },
                )),
              ],
            ),
            onTap: menuFunc[0],
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(menuTitles[1]),
                Text('${sliderValue[1].truncate()}'),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(menuDesc[1], softWrap: true),
                Slider(
                  min: 0,
                  max: 100,
                  value: sliderValue[1],
                  onChanged: (value) {
                    setState(() {
                      sliderValue[1] = (value);
                      sliderValue[0] =
                          (value >= sliderValue[0]) ? value : sliderValue[0];
                    });
                  },
                ),
              ],
            ),
            onTap: menuFunc[1],
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(menuTitles[2])],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(menuDesc[2], softWrap: true)],
            ),
            onTap: menuFunc[2],
          ),
        ],
      ),
    );
  }
}
