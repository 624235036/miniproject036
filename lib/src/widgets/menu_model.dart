import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
class Menu {
  final String title;
  final IconData icon;
  final Color iconColor;
  final Function(BuildContext context) onTap;


  const Menu({
    this.title,
    this.icon,
    this.iconColor = Colors.grey,
    this.onTap,
  });
}


class MenuViewModel {
  MenuViewModel();


  List<Menu> get items => <Menu>[
    Menu(
      title: 'Profile',
      icon: Icons.person,
      iconColor: Colors.red,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.infoRoute);
      },
    ),
    Menu(
      title: 'ประเภทห้องเช้า',
      icon: Icons.account_balance,
      iconColor: Colors.blue,
      onTap: (context) {
        Navigator.pushNamed(context, AppRoute.apartmentinfoRoute);
      },
    ),
    Menu(
      title: 'เปรียบเทียบราคาราห้องเช่า',
      icon: Icons.dashboard,
      iconColor: Colors.green,
      onTap: (context) {
        //todo
      },
    ),
    Menu(
      title: 'เพิ่มห้องเช่า',
      icon: Icons.add_circle,
      iconColor: Colors.pink,
      onTap: (context) {
        //todo
      },
    ),
  ];
}