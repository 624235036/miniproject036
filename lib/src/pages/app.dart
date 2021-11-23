import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/configs/app_setting.dart';
import 'package:flutterapp/src/pages/login/login_page.dart';
import 'package:flutterapp/src/pages/movie/upcoming_movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/home_pages.dart';
import 'info/info_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: AppRoute().getAll,
      theme: ThemeData(primaryColor: Colors.blueAccent),
      // home: LoginPage(),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Container(color: Colors.white,);
          }
          final token = snapshot.data.getString(AppSetting.userNameSettiing ?? '');
          if(token != null){
            return Homepage();
          }else{
            return LoginPage();
          }
        },
      ),
    );
  }
} //end class
