import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:wealth_wars/methods/account_manager.dart';
import 'package:wealth_wars/methods/shared_preferences.dart';
import 'package:wealth_wars/pages/homePage/home_screen.dart';
import 'package:webview_cookie_manager/webview_cookie_manager.dart';
import 'initialPage/initial_page.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Logger logger = Logger();
  final cookieManager = WebviewCookieManager();

  void checkSession() async {
    await cookieManager.clearCookies();

    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const InitialPage()));
    }
  }

  @override
  void initState() {
    super.initState();
    checkSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/logo.png', height: 175.0),
            const SizedBox(height: 20),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
