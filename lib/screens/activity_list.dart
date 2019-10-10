import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';
import 'package:indagrow/widgets/custom_list_card.dart';

class ActivityListPage extends StatefulWidget {
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  var responseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
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
        child: ListView(
          children: <Widget>[
            CustomListCard(
              leadingIcon: Icon(Icons.add),
              cardTitle: Text("Add New Crop"),
              cardSubtitle: Text("add new crop"),
              onTap: () {
                Navigator.of(context).pushNamed('/addActivity');
              },
            ),
            CustomListCard(
              leadingIcon: Icon(Icons.add),
              cardTitle: Text("Add Crop Activity"),
              cardSubtitle: Text("Daily Crop Activity"),
              onTap: () {
                Navigator.of(context).pushNamed('/cropList');
              },
            ),
            CustomListCard(
              leadingIcon: Icon(Icons.add),
              cardTitle: Text("Harvest"),
              cardSubtitle: Text(
                  "Harvest a Crop"),
              onTap: () {
                Navigator.of(context).pushNamed('/addActivity');
              },
            )
          ],
        ),
      ),
    );
  }
}
