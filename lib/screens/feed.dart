import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  var responseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _feed();
  }

  Future<void> _feed() async {
    var jsonData = await APIRoutes.getFeed();
    try {
      print(jsonData['data'].toString());
      setState(() => responseData = jsonData['data']);
      if (jsonData['status'] != 'error') {
      } else {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(jsonData['message'].toString()),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: responseData != null ?ListView.builder(
          itemCount: responseData.length ?? 0,
          padding: EdgeInsets.all(5.0),
          itemBuilder: (BuildContext context, int i) {
            return Center(
              child: Container(
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/feedDetails'),
                  child: Card(
                    elevation: 5.0,
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              responseData[i]['title'].toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Tags(
                              itemCount: 1,
                              itemBuilder: (int index) {
                                return ItemTags(
                                  activeColor: Colors.red,
                                  pressEnabled: false,
                                  title: responseData[i]['tag'].toString(),
                                  index: 1,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              responseData[i]['author'].toString(),
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontWeight: FontWeight.w700,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ) : Text("Data Loading..."),
      ),
    );
  }
}
