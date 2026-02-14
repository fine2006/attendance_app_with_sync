import 'package:attendance_app_with_sync/database/sharedprefs.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app_with_sync/database/database.dart';
import 'package:flutter_smart_debouncer/flutter_smart_debouncer.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final sliderDebouncer = Debouncer<void>(
    delay: const Duration(milliseconds: 500),
  );
  final List<String> menuTitles = <String>[
    "High Threshold",
    "Low Threshold",
    "Clear All Subjects",
  ];
  final List<String> menuDesc = <String>[
    //"The percentage at which the subject is marked with yellow",
    //"The percentage at which the subject is marked with red",
    "Attendance Threshold for warning.",
    "Attendance Threshold for alert.",
    "Reset all settings, and delete all subjects",
  ];
  List<bool> isSlider = <bool>[true, true, false];
  late List<double> sliderValue = <double>[85, 75, 0];
  void setSliders() async {
    double lo = await AppPreferences.loadLowBound();
    double hi = await AppPreferences.loadHighBound();
    setState(() {
      sliderValue[0] = hi;
      sliderValue[1] = lo;
    });
  }

  @override
  void initState() {
    super.initState();
    setSliders();
  }

  @override
  Widget build(BuildContext context) {
    final AppDatabase database = Provider.of<AppDatabase>(context);
    final List menuFunc = [
      null,
      null,
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
            enabled: true,
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
                Slider(
                  min: 0,
                  max: 100,
                  divisions: 20,
                  value: sliderValue[0],
                  onChanged: (value) {
                    setState(() {
                      sliderValue[0] =
                          (value <= sliderValue[1]) ? sliderValue[1] : value;
                    });
                    sliderDebouncer(() {
                      AppPreferences.saveHighBound(sliderValue[0]);
                    });
                  },
                ),
              ],
            ),
            onTap: null,
          ),
          ListTile(
            enabled: true,
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
                  divisions: 20,
                  value: sliderValue[1],
                  onChanged: (value) {
                    setState(() {
                      sliderValue[1] = (value);
                      sliderValue[0] =
                          (value >= sliderValue[0]) ? value : sliderValue[0];
                    });
                    sliderDebouncer(() {
                      AppPreferences.saveHighBound(sliderValue[0]);
                      AppPreferences.saveLowBound(sliderValue[1]);
                    });
                  },
                ),
              ],
            ),
            onTap: null,
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
