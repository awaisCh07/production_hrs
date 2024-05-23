import 'package:flutter/material.dart';
import 'package:fypatucp/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isChecked = false;
  bool _isObscure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryDarkColor,
      appBar: AppBar(
        backgroundColor: kPrimaryDarkColorWith30Opacity,
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            'Productive Hours',
            style: TextStyle(color: kPrimaryLightColor),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          padding: const EdgeInsets.all(30.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kPrimaryLightColor, Colors.black87],
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!isValidEmail(value)) {
                      return 'Please enter a valid email';
                    }
                    return null; // Return null if validation passes
                  },
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                  ),
                  obscureText: _isObscure,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null; // Return null if validation passes
                  },
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (newValue) {
                        setState(() {
                          _isChecked = newValue!;
                        });
                      },
                    ),
                    const Text('Save Password'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Handle "Forgot Password?" button press (navigation or action)
                    // You can display a dialog or navigate to a password reset screen
                    // Mostly, a link is sent to Email written in Email field
                  },
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: kPrimaryLightColor, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.12,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, proceed with login logic
                        // For now, let's just navigate to the dashboard
                        Navigator.pushNamed(context, '/dashboard');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: kPrimaryLightColor),
                          borderRadius: BorderRadius.circular(10.0)),
                      backgroundColor: kPrimaryDarkColor,
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: kPrimaryLightColor),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to validate email format
  bool isValidEmail(String email) {
    // Regular expression for email validation
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }
}
