import 'package:flutter/material.dart';
import 'package:flutterapp/src/pages/apartment/apartment_detail.dart';
import 'package:flutterapp/src/pages/apartment/apartment_page.dart';
import 'package:flutterapp/src/pages/apartnentInfo/apartment.dart';
import 'package:flutterapp/src/pages/condo/condo_detail.dart';
import 'package:flutterapp/src/pages/condo/condo_page.dart';
import 'package:flutterapp/src/pages/map/google_map_page.dart';
import 'package:flutterapp/src/pages/pages.dart';
import 'package:flutterapp/src/pages/scan/qp_scan_page.dart';
import 'package:flutterapp/src/pages/scan/qr_create_page.dart';

class AppRoute{
  static const homeRoute = "home";
  static const infoRoute = "info";
  static const loginRoute = "login";
  static const UpcomingMovieRoute = "upcoming";
  static const movieDetailRoute = "movie";
  static const videoRoute = "video";
  static const qrScanRoute = "qrscan";
  static const qrCreateRoute = "qrcreate";
  static const mapRoute = "map";
  static const apartmentinfoRoute = "apartmentinfo";
  static const apartmentRoute = "apartment";
  static const condoRoute = "condo";
  static const apmdetailRoute = "apmdetail";
  static const condodetailRoute = "condotail";

  final _route = <String, WidgetBuilder>{
    homeRoute: (context) => Homepage(),
    infoRoute: (context) => InfoPage(),
    loginRoute: (context) => LoginPage(),
    UpcomingMovieRoute: (context) => UpcomingMoviePage(),
    movieDetailRoute: (context) => MovieDetailPage(),
    videoRoute: (context) => VideoPage(),
    qrScanRoute: (context) => QRCodeScanPage(),
    qrCreateRoute: (context) => QRCreatePage(),
    mapRoute: (context) => GoogleMapPage(),
    apartmentinfoRoute: (context) => ApartmentInfp(),
    apartmentRoute: (context) => ApmPage(),
    condoRoute: (context) => CondoPage(),
    apmdetailRoute: (context) => ApmDetailPage(),
    condodetailRoute: (context) => CondoDetailPage(),
  };

  get getAll => _route;
}//end class