import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';

class ApartmentInfp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('ประเภทห้องเช่า'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFF2980B9), Color(0xFFF6DD5FA)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0,1],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/apartment.jpg'),
              ),
              Text(
                'ประเภทห้องเช่า',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.white),
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: Divider(
                  color: Colors.teal.shade100,
                  thickness: 5,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, AppRoute.condoRoute);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_balance,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'คอนโดมิเนียน',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(onTap: (){
                Navigator.pushNamed(context, AppRoute.apartmentRoute);
              },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.teal,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'อพาร์ทเมนท์',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.weekend,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'แมนชั่น',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.store_mall_directory,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'หอพัก',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
