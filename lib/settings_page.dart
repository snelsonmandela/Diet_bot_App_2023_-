import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool soundEnabled = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Sound',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: soundEnabled,
              onChanged: (value) {
                setState(() {
                  soundEnabled = value;
                });
                // Add logic to enable/disable sound here
              },
            ),
            SizedBox(height: 20.0),
            Text(
              'Notifications',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Switch(
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
                // Add logic to enable/disable notifications here
              },
            ),
          ],
        ),
      ),
    );
  }
}
