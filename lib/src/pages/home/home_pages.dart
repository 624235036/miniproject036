import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/configs/app_setting.dart';
import 'package:flutterapp/src/widgets/menu_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _current = 0;

  final List<String> imgList = [
    'https://static.posttoday.com/media/content/2018/11/12/D8359A2BC6B14AE981163E677F466165.jpg',
    'https://s359.kapook.com/rq/580/435/50/pagebuilder/3647980e-7cde-4d4d-89e5-63c91dc1a667.jpg',
    'https://www.origin.co.th/wp-content/uploads/2019/08/DSC3469-1024x683.jpg',
    'https://s3-ap-southeast-1.amazonaws.com/o77site/dcondo-hideaway-condominium-landscape-935x745.jpg',
    'https://s359.kapook.com/pagebuilder/bbb2c35a-ee72-4fe1-a78c-28e1cac37ba7.jpg',
    'https://www.qh.co.th/upload/project/97/15135f1b2dda29c51_TheTrustcondo%E0%B8%87%E0%B8%B2%E0%B8%A1%E0%B8%A7%E0%B8%87%E0%B8%84%E0%B9%8C%E0%B8%A7%E0%B8%B2%E0%B8%99_PIC1.jpg'
  ];

  List<Map<String, String>> imgArray = [
    {
      "img":
          "https://images.unsplash.com/photo-1501084817091-a4f3d1d19e07?fit=crop&w=2700&q=80",
      "title": "Login",
      "description":
          "You need a creative space ready for your art? We got that covered.",
      "price": "\$125",
      "page": "login"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1500628550463-c8881a54d4d4?fit=crop&w=2698&q=80",
      "title": "Info",
      "description":
          "Don't forget to visit one of the coolest art galleries in town.",
      "price": "\$200",
      "page": "info"
    },
    {
      "img":
          "https://images.unsplash.com/photo-1496680392913-a0417ec1a0ad?fit=crop&w=2700&q=80",
      "title": "Upcoming",
      "description":
          "Some of the best music video services someone could have for the lowest prices.",
      "price": "\$300",
      "page": "upcoming"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              //accountName: Text('kaswan'),
              accountEmail: Text('624235036@parichat.skru.ac.th'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/apartment.jpg'),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ...MenuViewModel()
                .items
                .map((e) => ListTile(
                      leading: Icon(
                        e.icon,
                        color: e.iconColor,
                      ),
                      title: Text(e.title),
                      onTap: () {
                        e.onTap(context);
                      },
                    ))
                .toList(),
            Spacer(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.orange,
              ),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(AppSetting.userNameSettiing);
                prefs.remove(AppSetting.passwordSetting);
                Navigator.pushNamed(context, AppRoute.loginRoute);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Home')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'MOBILE APPPLICATION',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.condoRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/icon.jpg'),
                          scale: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('apartment')],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.apartmentRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/apartment.jpg'),
                          scale: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('condo')],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(onTap: () {
                  Navigator.pushNamed(context, AppRoute.mapRoute);
                },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.png'), scale: 10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('Map')],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                GestureDetector(onTap: () {
                    Navigator.pushNamed(context, AppRoute.qrCreateRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/qr-gen.png'),
                          scale: 9),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [Text('QR Gen')],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.qrScanRoute);
                  },
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      image: DecorationImage(
                          image: AssetImage('assets/images/qr-scan.png'),
                          scale: 8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      //children: [Text('Map')],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: Divider(
                color: Colors.teal,
                thickness: 5,
              ),
            ),
            // Card(
            //   clipBehavior: Clip.antiAliasWithSaveLayer,
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15)),
            //   elevation: 8,
            //   margin: EdgeInsets.all(10),
            //   child: Column(
            //     children: [
            //       Ink.image(
            //         image: AssetImage('assets/images/leaf.jpg'),
            //         height: 200,
            //         fit: BoxFit.fill,
            //       ),
            //       Text('leaf of my life'),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 20,
            ),
            // ListTile(
            //   shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(15)),
            //   trailing: Icon(
            //     Icons.lock,
            //     color: Colors.grey,
            //   ),
            //   leading: CircleAvatar(
            //     backgroundImage: AssetImage('assets/images/hh.png'),
            //   ),
            //   title: Text('Info Page'),
            //   subtitle: Text('kuaswan'),
            // ),
            SizedBox(
              height: 20,
            ),
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              itemBuilder: (context, index, realIdx) {
                return Container(
                  child: Center(
                      child: Image.network(imgList[index],
                          fit: BoxFit.cover, width: 1000)),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 8,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Ink.image(
                    image: AssetImage('assets/images/bibi.jpg'),
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                  Text('apartment of my life'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // CarouselSlider(
            //   items: imgArray
            //       .map((item) => GestureDetector(
            //             onTap: () {
            //               Navigator.pushNamed(context, item["page"]);
            //             },
            //             child: Container(
            //               child: Column(
            //                 children: [
            //                   Padding(
            //                     padding: const EdgeInsets.all(8.0),
            //                     child: Container(
            //                       decoration: BoxDecoration(boxShadow: [
            //                         BoxShadow(
            //                             color: Color.fromRGBO(0, 0, 0, 0.4),
            //                             blurRadius: 8,
            //                             spreadRadius: 0.3,
            //                             offset: Offset(0, 3))
            //                       ]),
            //                       child: AspectRatio(
            //                         aspectRatio: 2 / 2,
            //                         child: ClipRRect(
            //                           borderRadius: BorderRadius.circular(4),
            //                           child: Image.network(
            //                             item["img"],
            //                             fit: BoxFit.cover,
            //                             alignment: Alignment.topCenter,
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: const EdgeInsets.only(top: 16.0),
            //                     child: Column(
            //                       children: [
            //                         Text(item["price"],
            //                             style: TextStyle(
            //                                 fontSize: 16, color: Colors.teal)),
            //                         Text(item["title"],
            //                             style: TextStyle(
            //                                 fontSize: 32, color: Colors.black)),
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               left: 16.0, right: 16.0, top: 8),
            //                           child: Text(
            //                             item["description"],
            //                             style: TextStyle(
            //                                 fontSize: 16, color: Colors.teal),
            //                             textAlign: TextAlign.center,
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //           ))
            //       .toList(),
            //   options: CarouselOptions(
            //       height: 530,
            //       autoPlay: false,
            //       enlargeCenterPage: false,
            //       aspectRatio: 4 / 4,
            //       enableInfiniteScroll: false,
            //       initialPage: 0,
            //       // viewportFraction: 1.0,
            //       onPageChanged: (index, reason) {
            //         setState(() {
            //           _current = index;
            //         });
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
