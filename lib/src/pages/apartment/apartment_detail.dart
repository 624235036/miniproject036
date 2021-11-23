import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterapp/src/configs/api.dart';
import 'package:flutterapp/src/model/apm_model.dart';

class ApmDetailPage extends StatefulWidget {
  @override
  _ApmDetailPageState createState() => _ApmDetailPageState();
}

class _ApmDetailPageState extends State<ApmDetailPage> {
  Apartment _apmModel;
  @override
  void initState() {
    _apmModel = Apartment();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Apartment) {
      _apmModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(_apmModel.apmName),
      ),

      body: SingleChildScrollView(
        child: Card(

          color: Colors.white,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),


          child: Column(
            children: [
              SizedBox(
                width: 500,
                child: Image.network(
                    API.APARTMENT_IMAGE + _apmModel.apmImage),
              ),
              Text(
                '' + _apmModel.apmName,
              ),
              Container(
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'รายละเอียด',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(_apmModel.apmLocation),
              SizedBox(height: 5,),

              Text(_apmModel.apmDetail),
              // ButtonBar(
              //   alignment: MainAxisAlignment.center,
              //   children: [
              //     IconButton(icon: Icon(Icons.favorite_border,size: 25, color: Colors.red,),
              //       onPressed: (){},
              //     ),
              //     IconButton(icon: Icon(Icons.add_alert_outlined,size: 25, color: Colors.purple,),
              //       onPressed: (){},
              //     ),
              //     IconButton(icon: Icon(Icons.share,size: 25, color: Colors.amber,),
              //       onPressed: (){},
              //     ),
              //     TextButton(
              //         child: Text('Review'),
              //         onPressed: () {
              //           print('Pressed');
              //         }
              //     )
              //   ],
              // ),
              // ElevatedButton(
              //   onPressed: () {
              //     //Navigator.pushNamed(context, AppRoute.videoRoute, arguments: _condoModel.id);
              //   },
              //   style: ElevatedButton.styleFrom(primary: Colors.cyan),
              //   child: Text('จองห้องพัก'),
              // ),
              Text(
                'Comment',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: RatingBar.builder(
                  minRating: 1,
                  itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {},
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: 'comment..',
                  prefixIcon: Icon(Icons.send),
                  hintStyle: TextStyle(color: Colors.grey),
                  fillColor: Colors.white70,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    borderSide: BorderSide(color: Colors.black38, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(color: Colors.black38, width: 2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}