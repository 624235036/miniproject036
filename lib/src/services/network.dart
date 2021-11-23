import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterapp/src/configs/api.dart';
import 'package:flutterapp/src/model/apm_model.dart';
import 'package:flutterapp/src/model/condo_model.dart';
import 'package:flutterapp/src/model/upcoming_movie_model.dart';
import 'package:flutterapp/src/model/video_model.dart';

class NetworkServices{
  NetworkServices._internal();

  static final NetworkServices _instace = NetworkServices._internal();

  factory NetworkServices() => _instace;

  static final Dio _dio = Dio();



  Future<UpcomingMovieModel> getUpcomingMovieDio()  async {
    final response = await _dio.get(API.MOVIE_URL);
    if (response.statusCode == 200) {
      return upcomingMovieModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<VideoModel> getVideoDio(String id) async {
    String vdoUrl = 'https://api.themoviedb.org/3/movie/';
    String key = '/videos?api_key=f90f90edb1f32dda20177c1d264d2b0f&language=en-US';

    final response = await _dio.get(vdoUrl+id+key);
    if (response.statusCode == 200) {
      return videoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<ApmModel> getAllApmDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.APARTMENT;
    print('url getAllApmDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return apmModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }

  Future<CondoModel> getAllCondoDio() async {
    //var url = API.BASE_URL + '/flutterapp/getAllGames_7.php';
    var url = API.BASE_URL + API.CONDO;
    print('url getAllCondoDio() = ' + url);
    final response = await _dio.get(url);
    if (response.statusCode == 200) {
      print(response.data);
      return condoModelFromJson(json.encode(response.data));
    }
    throw Exception('Network failed');
  }
}// end class
//https://api.themoviedb.org/3/movie/{movie_id}/videos?api_key=<<api_key>>&language=en-US