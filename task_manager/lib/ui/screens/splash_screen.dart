import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/provider/auth_provider.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';

import '../utils/asset_paths.dart';
import '../widgets/screen_background.dart';
import 'iogin_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));

    final authProvider = Provider.of<AuthProvider>(context,listen: false);

    await authProvider.loadUserData();


    if(authProvider.isLoggedIn){
      Navigator.pushReplacementNamed(context, '/NavBar');
    }else{
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Center(
          child: SvgPicture.asset(
            AssetPath.logoSVG,
            height: 50,
          ),
        ),
      ),
    );
  }
}