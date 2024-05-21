import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mybot/NavBar.dart';



import 'package:flutter/material.dart';
import 'package:mybot/firebase_options.dart';
import 'package:mybot/login_screen.dart';




import 'Messages.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dietBot',
      theme: ThemeData(brightness: Brightness.dark),
      home: LoginScreen(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode(); // Create a FocusNode
  bool isSendButtonHovered = false;

  List<Map<String, dynamic>> messages = [];

  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose(); // Dispose of the FocusNode
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(width: 300, child: NavBar()),
      appBar: AppBar(
        title: Text(
          'dietBot',
          style: TextStyle(
            fontFamily: 'Teko',
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFFF3E0EC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          child: Column(
            children: [
              Expanded(child: MessagesScreen(messages: messages)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: Color(0xFFCA9CE1),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        focusNode: _focusNode, // Attach the FocusNode
                        style: TextStyle(color: Color.fromARGB(239, 255, 255, 255)),
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                    MouseRegion(
                      onEnter: (_) {
                        setState(() {
                          isSendButtonHovered = true;
                        });
                      },
                      onExit: (_) {
                        setState(() {
                          isSendButtonHovered = false;
                        });
                      },
                      child: IconButton(
                        onPressed: () {
                          sendMessage(_controller.text);
                          _controller.clear();
                          _focusNode.requestFocus(); // Request focus on the TextField
                        },
                        icon: Icon(Icons.send),
                        color: isSendButtonHovered ? Colors.blue : Colors.black, // Change color when hovered
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
