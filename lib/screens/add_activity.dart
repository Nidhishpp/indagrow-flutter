import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';

class AddActivityPage extends StatefulWidget {
  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
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
        title: const Text('Add Activity'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _commentController,
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
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
            ],
          ),
        ),
      ),
    );
  }
}
