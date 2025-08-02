import '../login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../homepage.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController =
      TextEditingController(); // for Name
  final TextEditingController _nameController =
      TextEditingController(); // for Username
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;
  bool _rememberMe = false;

  String? _userError;
  String? _nameError;
  String? _passError;

  Future<void> _handleSignUp() async {
    setState(() {
      _userError = null;
      _nameError = null;
      _passError = null;
      _isLoading = true;
    });

    String name = _usernameController.text.trim();
    String username = _nameController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isEmpty || username.isEmpty || password.isEmpty) {
      setState(() {
        if (name.isEmpty) _userError = 'Name is required';
        if (username.isEmpty) _nameError = 'Username is required';
        if (password.isEmpty) _passError = 'Password is required';
        _isLoading = false;
      });
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isuser', false);
    await prefs.setString('name', name);
    await prefs.setString('username', username);
    await prefs.setString('password', password);
    await prefs.setBool('rememberMe', _rememberMe);
    // await prefs.setBool('isuser', true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/register.jpeg',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        "Please register to login.",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      if (_userError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(_userError!,
                              style: TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _nameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Username",
                          prefixIcon:
                              Icon(Icons.person_outline, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      if (_nameError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(_nameError!,
                              style: TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 15),
                      TextField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      if (_passError != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 10),
                          child: Text(_passError!,
                              style: TextStyle(color: Colors.red)),
                        ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Reminder me next time",
                            style: TextStyle(color: Colors.black87),
                          ),
                          Switch(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value;
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: _isLoading ? null : _handleSignUp,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color(0xFF00B894),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Center(
                            child: _isLoading
                                ? const SpinKitFadingCircle(
                                    color: Colors.white,
                                    size: 25.0,
                                    duration: Duration(seconds: 5),
                                  )
                                : Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account? ",
                                style: TextStyle(
                                    fontSize: 15.5, color: Colors.black)),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()),
                                );
                              },
                              child: Text("Sign In",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
