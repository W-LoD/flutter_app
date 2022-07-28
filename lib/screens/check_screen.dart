import 'package:flutter/material.dart';

import '../authoriz/prefs.dart';
import '../widgets/widgets.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => CheckScreenState();
}

class CheckScreenState extends State<CheckScreen>
    with SingleTickerProviderStateMixin {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();

    wait();
  }

  Future wait() async {
    await Future.delayed(const Duration(seconds: 2));
    isLoggedIn = await Preferences.getBool('Sign in', false);

    if (isLoggedIn) {
      Navigator.pushNamed(context, '/MS');
    } else {
      Navigator.pushNamed(context, '/LS');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.refresh,
            size: 300,
          ),
        ),
      ),
    );
  }
}
