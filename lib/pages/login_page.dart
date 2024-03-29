import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/config/app_routes.dart';
import 'package:flutter_app_1/config/app_strings.dart';
import 'package:flutter_app_1/model/user.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://localhost:8080';

class LoginPage extends StatelessWidget {
  final loginRoute = '$baseUrl/login';

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            const Spacer(),
            const Text(
              AppStrings.helloWelcome,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const Text(
              AppStrings.loginToContinue,
              style: TextStyle(color: Colors.white),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  hintText: AppStrings.username,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  filled: true,
                  fillColor: Colors.white.withOpacity(0.8)),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: AppStrings.password,
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    print('Forgot button is clicked');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(AppStrings.forgotPassword)),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    doLogin();
                    Navigator.of(context).pushReplacementNamed(AppRoutes.main);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black,
                  ),
                  child: const Text(AppStrings.login)),
            ),
            const Spacer(),
            const Text(
              AppStrings.orSignInWith,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 220,
              child: ElevatedButton(
                  onPressed: () {
                    print('Login with Google is clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google.png',
                          height: 22, width: 22),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(AppStrings.loginWithGoogle),
                    ],
                  )),
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 220,
              child: ElevatedButton(
                  onPressed: () {
                    print("Login with Facebook is clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/facebook.png',
                          height: 22, width: 22),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(AppStrings.loginWithFacebook)
                    ],
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  AppStrings.dontHaveAccount,
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.amber,
                    ),
                    child: const Text(
                      AppStrings.signup,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    )),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  Future<User> doLogin() async {
    final username = usernameController.text;
    final password = passwordController.text;
    final body = {
      'username': username,
      'password': password,
    };

    final response =
        await http.post(Uri.parse(loginRoute), body: jsonEncode(body));
    if (response.statusCode == 200) {
      print("Login successful");
      final json = jsonDecode(response.body);
      final user = User.fromJson(json);
      return user;
    } else {
      print('Error!');
      throw Exception('Error');
    }
  }
}
