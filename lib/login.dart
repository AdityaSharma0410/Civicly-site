import '../signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // <-- new import
import '../homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  bool _obscurePassword = true;
  bool _isLoading = false; // <-- new loading flag
  String? _userError;
  String? _passError;
  String? _credentialError;

  @override
  void initState() {
    super.initState();
    // _saveDefaultCredentials();
    _prefillCredentialsIfRemembered();
  }

  // Future<void> _saveDefaultCredentials() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (!prefs.containsKey('username')) {
  //     await prefs.setString('username', 'admin');
  //     await prefs.setString('password', 'admin');
  //   }
  // }

  Future<void> _prefillCredentialsIfRemembered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool remember = prefs.getBool('rememberMe') ?? false;
    if (remember) {
      _usernameController.text = prefs.getString('username') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
    }
  }

  Future<void> _handleLogin() async {
    setState(() {
      _userError = null;
      _passError = null;
      _credentialError = null;
      _isLoading = true; // <-- start spinner
    });

    String enteredUser = _usernameController.text.trim();
    String enteredPass = _passwordController.text.trim();

    // basic validation
    if (enteredUser.isEmpty || enteredPass.isEmpty) {
      setState(() {
        if (enteredUser.isEmpty) _userError = 'Username is required';
        if (enteredPass.isEmpty) _passError = 'Password is required';
        _isLoading = false; // <-- stop spinner
      });
      return;
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedUser = prefs.getString('username');
    String? savedPass = prefs.getString('password');

    if (enteredUser == savedUser && enteredPass == savedPass) {
      await prefs.setBool('isuser', true);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      // no need to stop spinner because page is replaced
    } else {
      setState(() {
        _credentialError = 'Invalid username or password';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Scrollbar(
              controller: _scrollController,
              thickness: 5,
              radius: Radius.circular(10),
              child: SingleChildScrollView(
                controller: _scrollController,
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
                            'assets/images/sign_in.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          "Please Sign In to continue.",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black38,
                          ),
                        ),
                        const SizedBox(height: 30),
                        TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            hintText: "Eg: John Doe",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.person, color: Colors.grey),
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
                            child: Text(
                              _userError!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 15),
                        TextField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: "Eg: JohnDoe@123",
                            hintStyle: const TextStyle(color: Colors.grey),
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.grey),
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
                            child: Text(
                              _passError!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        if (_credentialError != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              _credentialError!,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        const SizedBox(height: 17),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _isLoading ? null : _handleLogin,
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF00B894),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: _isLoading
                                    ? const SpinKitFadingCircle(
                                        color: Colors.white,
                                        size: 25.0,
                                        duration: const Duration(seconds: 5),
                                      )
                                    : Text(
                                        "Sign In",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
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
                              Text(
                                "Don't have account? ",
                                style: TextStyle(
                                  fontSize: 15.5,
                                  color: Colors.black,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
