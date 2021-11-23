import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/model/upcoming_movie_model.dart';
import 'package:flutterapp/src/services/network.dart';

class UpcomingMoviePage extends StatefulWidget {
  @override
  _UpcomingMoviePageState createState() => _UpcomingMoviePageState();
}

class _UpcomingMoviePageState extends State<UpcomingMoviePage> {
  Future<UpcomingMovieModel> _upcomingMovieModle;
  List movies = [];
  List fileMovies = [];
  bool isSearching = false;

  @override
  void initState() {
    _upcomingMovieModle = NetworkServices().getUpcomingMovieDio();
    super.initState();
  }

  void _fileMovies(value) {
    setState(() {
      fileMovies = movies
          .where((movie) =>
              movie['name'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !isSearching
            ? Text('upcomingmovie')
            : TextField(
                onChanged: (value){
                  _fileMovies(value);
                },
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search Movie',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      this.isSearching = false;
                      fileMovies = movies;
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.isSearching = true;
                    });
                  },
                )
        ],
      ),
      body: Container(
        child: FutureBuilder<UpcomingMovieModel>(
          future: _upcomingMovieModle,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.results.length,
                itemBuilder: (context, index) {
                  var movie = snapshot.data.results[index];
                  print(movie.title);
                  return ListTile(
                    onTap: () {
                      print('click list');
                      Navigator.pushNamed(context, AppRoute.movieDetailRoute,
                          arguments: movie);
                    },
                    title: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: ClipRRect(
                            child: Image.network(
                                'https://image.tmdb.org/t/p/w500/' +
                                    movie.posterPath),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(movie.releaseDate.year.toString()),
                              ],
                            ),
                          ),
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
