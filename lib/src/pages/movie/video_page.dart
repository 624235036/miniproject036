import 'package:flutter/material.dart';
import 'package:flutterapp/src/model/video_model.dart';
import 'package:flutterapp/src/services/network.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  String _id;
  Future<VideoModel> _vdoModle;

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context).settings.arguments;
    _id = arguments.toString();
    _vdoModle = NetworkServices().getVideoDio(_id);

    return Scaffold(
      appBar: AppBar(
        title: Text('VDO'),
      ),
      body: Container(
        child: FutureBuilder<VideoModel>(
          future: _vdoModle,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  var vdo = snapshot.data.results[index];
                  print(vdo.name);
                  YoutubePlayerController _controller = YoutubePlayerController(
                    initialVideoId: vdo.key,
                    flags: YoutubePlayerFlags(
                      autoPlay: false,
                      mute: false,
                    ),
                  );
                  return Card(
                    color: Colors.blueAccent,
                    child: Column(
                      children: [
                        Text(vdo.name),
                        YoutubePlayer(
                          controller: _controller,
                          liveUIColor: Colors.amber,
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
