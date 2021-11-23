import 'package:flutter/material.dart';
import 'package:flutterapp/src/configs/api.dart';
import 'package:flutterapp/src/configs/app_route.dart';
import 'package:flutterapp/src/model/apm_model.dart';
import 'package:flutterapp/src/services/network.dart';

class ApmPage extends StatefulWidget {
  @override
  _ApmPageState createState() => _ApmPageState();
}

class _ApmPageState extends State<ApmPage> {
  Future<ApmModel> _apartmentModel;
  bool isSearching = false;

  String _searchText = "";
  _ApmPageState() {
    _filter.addListener(() {
      if(_filter.text.isEmpty){
        setState(() {
          _searchText = "";
          filteredNames = names;
        });

      }else{
        setState(() {
          _searchText = _filter.text;
        });

      }
    });

  }



  @override
  void initState() {
    _getNames();
    super.initState();
  }

  List names = new List();
  List filteredNames = new List();

  Future<void> _getNames() async {
    List tempList = new List();

    _apartmentModel = NetworkServices().getAllApmDio();
    if (_apartmentModel.toString().isNotEmpty) {
      await _apartmentModel.then((value) => {
        for (int i = 0; i < value.apartments.length; i++)
          {
            tempList.add(value.apartments[i]),
          }
      });
    } //end if
    setState(() {
      names = tempList;
      names.shuffle();
      filteredNames = names;
    });
  } //end method

  @override
  Widget build(BuildContext context) {
    if(!_searchText.isEmpty){
      List tempList = new List();
      for(int i = 0; i < filteredNames.length; i++){
        Apartment apartment = filteredNames[i];
        if(apartment.apmName.toLowerCase().contains(_searchText.toLowerCase())){
          tempList.add(filteredNames[i]);

        }

      }
      filteredNames = tempList;

    }else{
      filteredNames = names;
    }
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Container(
        child: FutureBuilder<ApmModel>(
            future: NetworkServices().getAllApmDio(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1,
                      mainAxisSpacing: 5,
                      crossAxisSpacing: 5),
                  itemCount: names == null ? 0 : filteredNames.length,
                  itemBuilder: (context, index) {
                    Apartment apartment = filteredNames[index];
                    return Material(
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.pushNamed(
                        //       //context, AppRoute.condodetailRoute,
                        //       arguments: condo);
                        // },
                        child: Column(
                          children: [
                            SizedBox(height: 20,),
                            Card(
                              child: Container(
                                color: Colors.teal.shade50,
                                child: ListTile(
                                  title: Column(
                                    children: [
                                      apartment.apmImage != ""
                                          ? Image.network(
                                        API.APARTMENT_IMAGE + apartment.apmImage,
                                        height: 250,width: 300,
                                      )
                                          : Image.asset(
                                        'assets/images/no_photo.png',
                                        height: 160,
                                      ),
                                      Text(
                                        apartment.apmId + "  " + apartment.apmName,
                                        textAlign: TextAlign.center,
                                      ),
                                      apartment.apmDetail == '0'
                                          ? Text(
                                        '฿' +
                                            apartment.apmPrice +
                                            ' out of stock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30),
                                      )
                                          : Text('฿' +
                                          apartment.apmPrice +
                                          '  ' +
                                          apartment.apmPhone +
                                          ''),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 20),
                                          RaisedButton(
                                            onPressed: () {
                                              Navigator.pushNamed(context, AppRoute.apmdetailRoute,arguments: apartment);

                                            },
                                            // List: RaisedButton(
                                            //     primary: Colors.teal),
                                            child: Text('รายละเอียด'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('Search');

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _appBarTitle,
      actions: [
        IconButton(
            onPressed: () {
              _searchPressed();
            },
            icon: _searchIcon)
      ],
    );
  }

  final TextEditingController _filter = new TextEditingController();

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        print('IF search icon');
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          style: TextStyle(color: Colors.white60, fontSize: 20),
          controller: _filter,
          decoration: new InputDecoration(
              suffixIcon: Icon(Icons.search),
              hintText: 'Search...'
          ),
        );
      } else {
        print('ELSE search icon');
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = new Text('');
        filteredNames = names;
        _filter.clear();
      }
    });
  }
}