import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';

class PillsReminderPage extends StatefulWidget {
  @override
  _PillsReminderPageState createState() => _PillsReminderPageState();
}

class _PillsReminderPageState extends State<PillsReminderPage> {
  // Define variables to store user input
  String pillName = '';
  int pillsAmount = 0;
  String medicineForm = '';
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null)
      setState(() {
        selectedTime = picked;
      });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pills Reminder'),
        backgroundColor: Color.fromARGB(207, 75, 71, 71),
      ),
      backgroundColor:  Color(0xFFF3E0EC),
      body: SingleChildScrollView(
        child: 
      Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.medical_services,
              size: 100.0,
              color:Color.fromARGB(255, 58, 252, 32),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  pillName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Pill Name'),
            ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  pillsAmount = int.tryParse(value) ?? 0;
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Pills Amount'),
            ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  medicineForm = value;
                });
              },
              decoration: InputDecoration(labelText: 'Medicine Form'),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                
                Text(
                  'Date: ${selectedDate.toLocal()}'.split(' ')[0],
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(width: 20.0),
                Text(
                  'Time: ${selectedTime.format(context)}',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Select Date'),
                  style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 48, 53, 47), // Button background color
    onPrimary: Colors.white, // Text color
  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text('Select Time'),
                  style: ElevatedButton.styleFrom(
    primary: Color.fromARGB(255, 42, 44, 42), // Button background color
    onPrimary: Colors.white, // Text color
  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add logic to save the reminder and navigate to another page.
                // You can access the user inputs (pillName, pillsAmount, medicineForm, selectedDate, selectedTime) here.
              },
              child: Text("Done"),
                  style: ElevatedButton.styleFrom(
                    primary:  Color.fromARGB(255, 42, 44, 42), // Button background color
                    onPrimary:Color.fromARGB(255, 255, 247, 247), // Text color
                  ),
            ),
          ],
        ),
      ),
    ),);
    
  }
}
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
