import 'package:flutter/material.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flushbar/flushbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  _logout() async {
    await AuthUtils.clearData();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: StaggeredGridView.count(
          shrinkWrap: true,
          // physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                      color: Colors.redAccent,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 26.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Welcome',
                            style: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                          Text(
                            'user',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {
                // Flushbar(
                //   title: "Hey",
                //   message: "text",
                //   duration: Duration(seconds: 3),
                //   borderRadius: 8,
                //   icon: Icon(
                //     Icons.check,
                //     color: Colors.greenAccent,
                //   ),
                //   isDismissible: true,
                //   // boxShadows: [BoxShadow(color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)],
                //   // leftBarIndicatorColor: Colors.blue[300],
                // )..show(context)
                Navigator.of(context).pushNamed('/profile')
              },
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.teal,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Icon(
                            Icons.comment,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 16.0,
                        ),
                      ),
                      Text(
                        'Feed',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Our Specials',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ]),
              ),
              onTap: () => Navigator.of(context).pushNamed('/feed'),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(
                            16.0,
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.0,
                      ),
                    ),
                    Text(
                      'Blog',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Your Basket',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.of(context).pushNamed('/blog'),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.teal,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(
                            16.0,
                          ),
                          child: Icon(
                            Icons.comment,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 16.0,
                        ),
                      ),
                      Text(
                        'Activity',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                      ),
                      Text(
                        'Our Specials',
                        style: TextStyle(
                          color: Colors.black45,
                        ),
                      ),
                    ]),
              ),
              onTap: () => Navigator.of(context).pushNamed('/activity'),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(
                            16.0,
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 16.0,
                      ),
                    ),
                    Text(
                      'Blog',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                      ),
                    ),
                    Text(
                      'Your Basket',
                      style: TextStyle(
                        color: Colors.black45,
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => {},
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(
                  24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   'Shop Items',
                        //   style: TextStyle(
                        //     color: Colors.redAccent,
                        //   ),
                        // ),
                        Text(
                          'Previous Orders',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                        )
                      ],
                    ),
                    Material(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(
                        24.0,
                      ),
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(
                            16.0,
                          ),
                          child: Icon(
                            Icons.store,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(2, 160.0),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      child: InkWell(
          // Do onTap() if it isn't null, otherwise do print()
          onTap: onTap != null
              ? () => onTap()
              : () {
                  print('Not set yet');
                },
          child: child),
    );
  }
}
