import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterapp/src/configs/api.dart';
import 'package:flutterapp/src/model/condo_model.dart';

class CondoDetailPage extends StatefulWidget {
  @override
  _CondoDetailPageState createState() => _CondoDetailPageState();
}

class _CondoDetailPageState extends State<CondoDetailPage> {
  Condo _condoModel;
  @override
  void initState() {
    _condoModel = Condo();
    super.initState();
  }

  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Condo) {
      _condoModel = arguments;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_condoModel.condoName),
      ),







      body: SingleChildScrollView(

        child: Container(
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
                      API.CONDO_IMAGE + _condoModel.condoImage),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '' + _condoModel.condoName,
                ),
                SizedBox(
                  height: 50,
                  width: 200,
                  child: Divider(
                    color: Colors.black26,
                    thickness: 3,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'รายละเอียด',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(_condoModel.condoLocation),
                SizedBox(
                  height: 10,
                ),

                Text(_condoModel.condoDetail),


                SizedBox(height: 15),
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

                // ButtonBar(
                //   children: [
                //     IconButton(icon: Icon(Icons.volume_down_outlined,size: 30, color: Colors.blue,),),
                //     IconButton(icon: Icon(Icons.volume_off_outlined,size: 25, color: Colors.pink,),),
                //     IconButton(icon: Icon(Icons.favorite_border,size: 25, color: Colors.red,),),
                //     IconButton(icon: Icon(Icons.add_alert_outlined,size: 25, color: Colors.purple,),),
                //     IconButton(icon: Icon(Icons.share,size: 25, color: Colors.amber,),),
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
                //   child: Text('VDO'),
                // ),
              ],
            ),
          ),
        ),


      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){
      //     Navigator.pushNamed(context, AppRoute.mapRoute);
      //
      //   },
      //   backgroundColor: Colors.teal.shade300,
      //   tooltip: 'add',
      //   child: Icon(Icons.map),
      // ),
    );

  }
}