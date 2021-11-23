import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('Vin Info'),
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
                radius: 50,
                backgroundImage: AssetImage('assets/images/kaka.png'),
              ),
              Text(
                'Kuaswan Kuji',
                style: TextStyle(
                    fontSize: 30, fontFamily: 'Pacifico', color: Colors.white),
              ),
              Text(
                'STUDENT',
                style: TextStyle(
                    fontFamily: 'Source Sans Pro,', color: Colors.white70),
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: Divider(
                  color: Colors.teal.shade100,
                  thickness: 5,
                ),
              ),
              Container(
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
                      'Nickname : Vin',
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
                      Icons.call,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '0992121732',
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
                      Icons.mail,
                      color: Colors.teal,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '624235036@parichat.skru.ac.th',
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
