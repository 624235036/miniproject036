import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/configs/app_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = false;

  var _usernameController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            AppBar(
              title: Text('เมนู'),
            ),
            ListTile(
              title: Text('ประเภทห้องเช้า'),
              onTap: (){
                Navigator.pushNamed(context, AppRoute.apartmentinfoRoute);
              },
            ),
            ListTile(
              title: Text('เปรียบเทียบราคาราห้องเช่า'),
            ),
            ListTile(
              title: Text('ลงชื่อเข้าใช้'),
              onTap: () {
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('ลงชื่อเข้าใช้'),
      ),
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF2980B9), Color(0xFFF6DD5FA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Image.network(
                  'https://png.pngtree.com/png-vector/20190115/ourlarge/pngtree-cartoon-wind-city-high-rise-apartment-city-office-building-urban-high-png-image_368912.jpg',
                  width: 150,
                  height: 150,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontFamily: 'Pacifico'),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: _usernameController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: 'username',
                            hintText: 'xx@gmail.com',
                            icon: Icon(Icons.person)),
                      ),
                      TextField(
                        controller: _passwordController,
                        obscureText: isHidden,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'password',
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                              icon: isHidden
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: togglePasswordVisibility),
                        ),
                      ),
                      RaisedButton(
                          onPressed: () async {
                            final username = _usernameController.text;
                            final password = _passwordController.text;
                            if (username == 'onijang' && password == '2525') {
                              print('login success');
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString(
                                  AppSetting.userNameSettiing, username);
                              prefs.setString(
                                  AppSetting.passwordSetting, password);
                              Navigator.pushNamed(context, AppRoute.homeRoute);
                            } else {
                              print('login failed');
                              Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.greenAccent,
                                ),
                                backgroundColor: Colors.pink,
                                title: "Failed",
                                message: "Login failed try again!",
                                duration: Duration(seconds: 3),
                              )..show(context);
                            }
                          },
                          child: Text('Login')),
                      //ElevatedButton(onPressed: (){}, child: Text('Login')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void togglePasswordVisibility() => setState(() => isHidden = !isHidden);
}
