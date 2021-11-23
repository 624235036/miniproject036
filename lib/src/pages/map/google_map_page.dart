import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMapPage extends StatefulWidget {
  @override
  State<GoogleMapPage> createState() => GoogleMapPageState();
}

class GoogleMapPageState extends State<GoogleMapPage> {
  Completer<GoogleMapController> _controller = Completer();


  static final CameraPosition _initMap = CameraPosition(
    target: LatLng(7.171472166327647, 100.61357176390162),
    zoom: 14.4746,
  );

  // StreamSubscription<LocationData> _locationSubscription;
  // final _locationService = Location();
   final Set<Marker> _markers = {};

  @override
  // void dispose() {
  //   _locationSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.normal,
        initialCameraPosition: _initMap,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _dummyLoction();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }
  Future<void> _dummyLoction() async {
    await Future.delayed(Duration(seconds: 2));
    List<LatLng> data = [
      LatLng(7.173872, 100.611274), //ฉัตรเพรช เเมนชั่น
      LatLng(7.175518, 100.6104), //Varee Place Apartment
      LatLng(7.170955, 100.606928), //Chamnan Residence Apartment
      LatLng(7.206521, 100.590624), //Songkhla Zoo
      LatLng(7.213881, 100.593156), // Wat Khaokaew
    ];

    List<String> placeName = ['ฉัตรเพรช เเมนชั่น','Varee Place Apartment','Chamnan Residence Apartment','D Memoria Phahonyothin','The Aura Uran Life'];

    for(int i=0; i<data.length; i++){
      await _addMarker(
        data[i],
        title: placeName[i],
        snippet: 'Go now !!',
        isShowInfo: true,
      );
    }

    _controller.future.then((controller) => controller.moveCamera(
        CameraUpdate.newLatLngBounds(_boundsFromLatLngList(data), 32)));
    setState(() {});
  }
  Future<Uint8List> _getBytesFromAsset(
      String path, {
        int width,
      }) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Future<void> _addMarker(
      LatLng position, {
        String title = 'none',
        String snippet = 'none',
        String pinAsset = 'assets/images/mod.png',
        bool isShowInfo = false,
      }) async {
    final Uint8List markerIcon = await _getBytesFromAsset(
      pinAsset,
      width: 100,
    );
    final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(markerIcon);

    _markers.add(
      Marker(
        // important. unique id
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: isShowInfo
            ? InfoWindow(
          title: title,
          snippet: snippet,
          onTap: () => _launchMaps(
            lat: position.latitude,
            lng: position.longitude,
          ),
        )
            : InfoWindow(),
        icon: bitmap,
        onTap: () async {
          //todo
        },
      ),
    );
  }

  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double x0, x1, y0, y1 = 0;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1) y1 = latLng.longitude;
        if (latLng.longitude < y0) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1, y1),
      southwest: LatLng(x0, y0),
    );
  }

  void _launchMaps({double lat, double lng}) async {
    final parameter = '?z=16&q=$lat,$lng';

    if (Platform.isIOS) {
      final googleMap = 'comgooglemaps://';
      final appleMap = 'https://maps.apple.com/';
      if (await canLaunch(googleMap)) {
        await launch(googleMap + parameter);
        return;
      }
      if (await canLaunch(appleMap)) {
        await launch(appleMap + parameter);
        return;
      }
    } else {
      final googleMapURL = 'https://maps.google.com/';
      if (await canLaunch(googleMapURL)) {
        await launch(googleMapURL + parameter);
        return;
      }
    }
    throw 'Could not launch url';
  }

  // void _trackingLocation() async {
  //   if (_locationSubscription != null) {
  //     _locationSubscription?.cancel();
  //     _locationSubscription = null;
  //     _markers.clear();
  //     setState(() {});
  //     return;
  //   }
  //
  //   try {
  //     final serviceEnabled = await _checkServiceGPS();
  //     if (!serviceEnabled) {
  //       throw PlatformException(code: 'SERVICE_STATUS_DENIED');
  //     }
  //
  //     final permissionGranted = await _checkPermission();
  //     if (!permissionGranted) {
  //       throw PlatformException(code: 'PERMISSION_DENIED');
  //     }
  //
  //      await _locationService.changeSettings(
  //        accuracy: LocationAccuracy.high,
  //        interval: 10000,
  //        distanceFilter: 100,
  //      ); // meters.
  //
  //      _locationSubscription = _locationService.onLocationChanged.listen(
  //            (locationData) async {
  //          _markers.clear();
  //          final latLng = LatLng(
  //            locationData.latitude,
  //            locationData.longitude,
  //          );
  //          await _addMarker(
  //            latLng,
  //            pinAsset: 'assets/images/pin_current.png',
  //          );
  //          _animateCamera(latLng);
  //          setState(() {});
  //        },
  //      );
  //   } on PlatformException catch (e) {
  //     switch (e.code) {
  //       case 'PERMISSION_DENIED':
  //       //todo
  //         break;
  //       case 'SERVICE_STATUS_ERROR':
  //       //todo
  //         break;
  //       case 'SERVICE_STATUS_DENIED':
  //       //todo
  //         break;
  //       default:
  //       //todo
  //     }
  //   }
  // }

  // Future<bool> _checkPermission() async {
  //   var permissionGranted = await _locationService.hasPermission();
  //   if (permissionGranted == PermissionStatus.granted) {
  //     return true;
  //   }
  //   permissionGranted = await _locationService.requestPermission();
  //   return permissionGranted == PermissionStatus.granted;
  // }

  // Future<bool> _checkServiceGPS() async {
  //   var serviceEnabled = await _locationService.serviceEnabled();
  //   if (serviceEnabled) {
  //     return true;
  //   }
  //   serviceEnabled = await _locationService.requestService();
  //   return serviceEnabled;
  // }

  Future<void> _animateCamera(LatLng latLng) async {
    _controller.future.then((controller) {
      controller.animateCamera(CameraUpdate.newLatLngZoom(latLng, 16));
    });
  }
}//end