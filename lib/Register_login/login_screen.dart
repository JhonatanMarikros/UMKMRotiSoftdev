import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:softdevuas/Register_login/auth_service.dart';
import 'package:softdevuas/Register_login/register.dart';
import 'package:softdevuas/main.dart';
import 'package:softdevuas/widgets/button.dart';
import 'package:softdevuas/widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = AuthService();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/cobacoba.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.45), BlendMode.dstATop)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const Spacer(),
              const Text("Login",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(height: 50),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Password",
                label: "Password",
                controller: _password,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Login",
                onPressed: _login,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already dont have an account? ",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur fontWeight menjadi bold
                    ),
                  ),
                  InkWell(
                    onTap: () => goToRegister(context),
                    child: const Text(
                      "Register",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight:
                            FontWeight.bold, // Mengatur fontWeight menjadi bold
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    ));
  }

  goToRegister(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterScreen()),
      );

  goToHome(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Main()),
      );

  _login() async {
    final user =
        await _auth.loginUserWithEmailAndPassword(_email.text, _password.text);

    if (user != null) {
      log("User Logged In");
      goToHome(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Silahkan lengkapi semua informasi terlebih dengan benar')),
      );
    }
  }
}
