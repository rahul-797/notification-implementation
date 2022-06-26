import 'package:api/services/auth_service.dart';
import 'package:api/views/home_view.dart';
import 'package:api/views/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninView extends StatefulWidget {
  const SigninView({Key? key}) : super(key: key);

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  bool isLoading = false;
  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
        titleTextStyle: const TextStyle(
          letterSpacing: 2,
          fontSize: 24,
          decorationStyle: TextDecorationStyle.wavy,
          decorationThickness: 3,
          decoration: TextDecoration.lineThrough,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.blue],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
        ),
        elevation: 10,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (val) =>
                              val!.isEmpty ? "Enter an email" : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: "Password",
                          ),
                          onChanged: (val) {
                            password = val;
                          },
                          validator: (val) => val!.length < 6
                              ? "Password must be 6 characters"
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          error,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              gradient: LinearGradient(
                                colors: [Colors.indigo, Colors.blue],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Sign in",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() => isLoading = true);
                              try {
                                dynamic result = await _authService
                                    .signinWithEmailPassword(email, password);
                                result == null
                                    ? setState(() {
                                        error = "Wrong email or password";
                                        isLoading = false;
                                      })
                                    : Get.offAll(() => const HomeView());
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: const TextStyle(color: Colors.black87),
                            children: [
                              TextSpan(
                                text: "Register Now!",
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.offAll(
                                        () => RegisterView(),
                                        transition: Transition.topLevel,
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
