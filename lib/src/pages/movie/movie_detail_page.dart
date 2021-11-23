import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/model/upcoming_movie_model.dart';
import 'package:share/share.dart';

class MovieDetailPage extends StatefulWidget {
  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Result _movieModel;


  @override
  void initState() {
    _movieModel = Result();
    super.initState();
  }
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    _speak() async{
      print(await flutterTts.getLanguages);
      await flutterTts.speak(_movieModel.overview);
    }
    _stop() async{
      print(await flutterTts.getLanguages);
      await flutterTts.stop();
    }

    Object arguments = ModalRoute.of(context).settings.arguments;
    if (arguments is Result) {
      _movieModel = arguments;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(_movieModel.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  child: Card(
                color: Colors.blueGrey.shade100,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                elevation: 5,
                margin: EdgeInsets.all(20),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Ink.image(
                          fit: BoxFit.fill,
                          height: 500,
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/' +
                                  _movieModel.posterPath),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'popularity : ' + _movieModel.popularity.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Overview',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      _movieModel.overview,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.volume_down,
                            color: Colors.orange,
                          ),
                          onPressed: ()=>_speak(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.volume_off,
                            color: Colors.red,
                          ),
                          onPressed: ()=>_stop(),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: (){
                            Icons.favorite;
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.share,
                            color: Colors.green,
                          ),
                            onPressed: (){
                            Share.share(_movieModel.overview);
                            },
                        ),
                      ],
                    )
                  ],
                ),
              )),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.videoRoute,
                      arguments: _movieModel.id);
                },
                child: Text('VEO'),
              )
            ],
          ),
        ));
  }
}
