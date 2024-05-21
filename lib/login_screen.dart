import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mybot/main.dart';
import 'package:mybot/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  String _email = "";
  String _password = "";
  bool _isPasswordVisible = false; // Track password visibility

  void _handleLogin(BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      print("User Logged In: ${userCredential.user!.email}");
        final snackBar = SnackBar(
      backgroundColor: Colors.green, // Background color
      content: Container(
        alignment: Alignment.center, // Center the content
        child: Text(
          "Login Successful",
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 16,
          ),
        ),
      ),
      duration: Duration(seconds: 2), // You can adjust the duration as needed
    );

    // Show the custom SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    } catch (e) {
      print("Error during Logged In: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Login"),
         // App bar color
      ),
      backgroundColor: Color(0xFFF3E0EC), // Set the background color to white
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/32.png", // Your app logo image
                  height: 350,
                  width: 350,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xFFCA9CE1)), // Outline color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCA9CE1)), // Focused border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xFFCA9CE1)), // Enabled border color
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 2, 2, 2)), // Label text color
                    prefixIcon: Icon(
                      Icons.mail,
                      color: Color(0xFFCA9CE1), // Icon color
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey, // Text field hint text color
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Text color
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xFFCA9CE1)), // Outline color
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFCA9CE1)), // Focused border color
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color:Color(0xFFCA9CE1)), // Enabled border color
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)), // Label text color
                    prefixIcon: Icon(
                      Icons.lock,
                      color:Color(0xFFCA9CE1), // Icon color
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: _isPasswordVisible
                            ? Color.fromARGB(255, 21, 236, 32)
                            : Colors.grey, // Change color based on visibility
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey, // Text field hint text color
                    ),
                  ),
                  style: TextStyle(color: Colors.black), // Text color
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _handleLogin(context);
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                    primary:Color(0xFFCA9CE1), // Button background color
                    onPrimary:const Color.fromARGB(255, 2, 2, 2), // Text color
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign up",
                    style: TextStyle(color: const Color.fromARGB(255, 2, 2, 2)), // Link text color
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
