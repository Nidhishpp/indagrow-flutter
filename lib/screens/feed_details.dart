import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';

class FeedDetailsPage extends StatefulWidget {
  @override
  _FeedDetailsPageState createState() => _FeedDetailsPageState();
}

class _FeedDetailsPageState extends State<FeedDetailsPage> {
  var responseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController();
    // _user();
  }

  // Future<void> _user() async {
  //   var jsonData = await APIRoutes.getUser();
  //   try {
  //     if (jsonData['status'] != 'error') {
  //       setState(() => responseData = jsonData);
  //       if (responseData['current'] == 'clue') {
  //         Navigator.of(context).pushReplacementNamed('/clue');
  //       } else if (responseData['current'] == 'activity') {
  //         Navigator.of(context).pushReplacementNamed('/activity');
  //       }
  //     } else {
  //       if (jsonData['type'] == 'unauthenticated') {
  //         _logout();
  //       } else {
  //         _scaffoldKey.currentState.showSnackBar(
  //           SnackBar(
  //             content: Text(jsonData['message'].toString()),
  //             duration: Duration(seconds: 3),
  //           ),
  //         );
  //       }
  //     }
  //   } catch (e) {}
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Card(
                elevation: 10.0,
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Hero(
                        tag: 1,
                        child: Text(
                          'Title',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Author"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Tags(
                          itemCount: 1,
                          itemBuilder: (int index) {
                            return ItemTags(
                              activeColor: Colors.red,
                              pressEnabled: false,
                              title: "title",
                              index: 1,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "tiime",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Container(
                  padding: EdgeInsets.only(
                    top: 20.0,
                    left: 15.0,
                    right: 15.0,
                    bottom: 10.0,
                  ),
                  child: Text(
                    "DefaultTextStyle is unrelated to the problem. Removing it simply uses the default style, which is far bigger than the one you used so it hides the problem.textAlign aligns the text in the space occupied by Text when that occupied space is bigger than the actual content.",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18.0,
                      height: 2.0,
                    ),
                    softWrap: true,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Add Comment",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _commentController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16.0),
                    hintText: 'Enter your Comment',
                    hintStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                  ),
                ),
              ),
              SizedBox(
                child: RaisedButton(
                  textColor: Colors.green,
                  color: Colors.white,
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Add Comment',
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/register');
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  "Comments",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 25.0,
                  ),
                ),
              ),
              Divider(
                color: Colors.black54,
                height: 2.0,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int i) {
                  return ListTile(
                    title: Text("data"),
                    subtitle: Text('author'),
                    leading: Icon(Icons.comment),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
