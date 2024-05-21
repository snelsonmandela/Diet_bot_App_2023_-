import 'package:flutter/material.dart';
import 'package:mybot/login_screen.dart';


import 'package:mybot/progress_page.dart';
import 'package:mybot/settings_page.dart';
class NavBar extends StatelessWidget {
  final commonGreenColor = Color(0xFFE4E1E4); // Define the common green color

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        primaryColor: Color.fromARGB(255, 204, 47, 29),
      ),
      child: Drawer(
        child: ListView(
          children: [
            
// Wrap UserAccountsDrawerHeader with a Column to align items
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Color(0xFFCA9CE1),
      ),
      accountEmail: Text(
        'user',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold, // Add bold style
        ),
      ),
      accountName: null, // Remove the account name from here
      currentAccountPicture: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 55,
        child: ClipOval(
          child: Image.network(
            'https://static.vecteezy.com/system/resources/previews/005/129/844/non_2x/profile-user-icon-isolated-on-white-background-eps10-free-vector.jpg',
            width: 110,
            height: 110,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ),
            ListTile(
              leading: Icon(Icons.article),
              title: Text('My diet plan'),
              tileColor: commonGreenColor, // Set common green background color
             onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MyDietPlanPage();
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.trending_up),
              title: Text('My progress'),
              tileColor: commonGreenColor, // Set common green background color
            onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ProgressPage();
                  },
                );
              },  
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              tileColor: commonGreenColor, // Set common green background color
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return HelpDialog();
                  },
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              tileColor: commonGreenColor, // Set common green background color
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AboutUsDialog();
                  },
                );
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              tileColor: commonGreenColor, // Set common green background color
             onTap: () {
                         Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
                      },
            ),
            
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              tileColor: commonGreenColor,
                 onTap: () {
                         Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
                      },
                   // Set common green background color
            ),
            ],
            ),// Continue to set the common green background color for other feature items
          ],
          
        ),
      ),
    );
  }

  static void pop(BuildContext context) {}
}

// ... (The rest of your code remains the same)


class AboutUsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('About Us'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My name is dietBot, created by Care Crafters.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'I will prepare you a diet plan, especially for diabetic patients.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
class HelpDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Help'),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To start, simply say "Hi", "my diet plan".',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'I will assist you to create a diet plan.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}


class MyDietPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Diet Plan'),
      ),
      body: Center(
        child: MultilineTextWidget(),
      ),
    );
  }
}

class MultilineTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define a multiline string using triple-quoted strings
    final multilineText = '''
     Day 1:

    Idli with Coconut Chutney and Sambar: Approximately 250-300 calories
    Vegetable Biryani with Raita: Approximately 400-500 calories
    Murukku: Approximately 200-250 calories
    Masala Dosa with Coconut Chutney: Approximately 350-450 calories

Total Calories for Day 1: Approximately 1200-1500 calories

Day 2:

    Pongal with Coconut Chutney: Approximately 300-350 calories
    Sambhar Rice with Papad: Approximately 400-500 calories
    Fruit Salad: Approximately 100-150 calories
    Rava Upma with Coconut Chutney: Approximately 300-400 calories

Total Calories for Day 2: Approximately 1100-1400 calories

Day 3:

    Aloo Paratha with Curd: Approximately 400-500 calories
    Cabbage Poriyal with Roti: Approximately 350-450 calories
    Banana Bajji: Approximately 200-250 calories
    Lemon Rice and Curd Rice: Approximately 400-500 calories

Total Calories for Day 3: Approximately 1350-1700 calories

Day 4:

    Uttapam with Coconut Chutney: Approximately 300-400 calories
    Cauliflower Masala Curry with Paratha: Approximately 400-500 calories
    Chana Chaat: Approximately 150-200 calories
    Puliyodarai with Appalam: Approximately 400-500 calories

Total Calories for Day 4: Approximately 1250-1600 calories

Day 5:

    Poori with Potato Masala: Approximately 400-500 calories
    Cucumber Dosa with Coconut Chutney: Approximately 350-450 calories
    Murukku with Filter Coffee: Approximately 200-250 calories
    Mixed Vegetable Curry with Rice and Curd: Approximately 400-500 calories

Total Calories for Day 5: Approximately 1350-1700 calories

Day 6:

    Aval Upma: Approximately 250-300 calories
    Avial with Steamed Rice: Approximately 400-500 calories
    Sundal: Approximately 150-200 calories
    Veg Kootu with Chapati: Approximately 400-500 calories

Total Calories for Day 6: Approximately 1200-1500 calories

Day 7:

    Adai with Coconut Chutney: Approximately 300-400 calories
    Eggplant Curry with Paratha: Approximately 400-500 calories
    Banana Chips with Lassi: Approximately 250-300 calories
    Cabbage Kootu with Rice and Pickle: Approximately 400-500 calories

Total Calories for Day 7: Approximately 1350-1700 calories
    ''';

     return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Text(
          multilineText,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}