import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:softdevuas/Register_login/auth_service.dart';
import 'package:softdevuas/Register_login/login_screen.dart';
import 'package:softdevuas/widgets/button.dart';
import 'package:softdevuas/widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _auth = AuthService();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
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
              const Text("Register",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 50,
              ),
              CustomTextField(
                hint: "Enter Name",
                label: "Name",
                controller: _name,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Email",
                label: "Email",
                controller: _email,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: "Enter Password",
                label: "Password",
                isPassword: true,
                controller: _password,
              ),
              const SizedBox(height: 30),
              CustomButton(
                label: "Register",
                onPressed: _Register,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(
                      fontWeight:
                          FontWeight.bold, // Mengatur fontWeight menjadi bold
                    ),
                  ),
                  InkWell(
                    onTap: () => goToLogin(context),
                    child: const Text(
                      "Login",
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

  goToLogin(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  successed(BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );

  _Register() async {
    final user =
        await _auth.createUserWithEmailAndPassword(_email.text, _password.text);
    if (user != null) {
      log("User Created Succesfully");
      successed(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Masukkan semua dengan benar dan gunakan password 6 Angka/Huruf')),
      );
    }
  }
}
