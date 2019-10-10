import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';

class BlogDetailsPage extends StatefulWidget {
  @override
  _BlogDetailsPageState createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  var responseData;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var loadingImg = 'assets/images/loading.gif';

  final String _markdownData = """# Markdown Example
Markdown allows you to easily include formatted text, images, and even formatted Dart code in your app.

## Styling
Style text as _italic_, __bold__, or `inline code`.

- Use bulleted lists
- To better clarify
- Your points

## Links
You can use [hyperlinks](hyperlink) in markdown

## Images

You can include images:

![Flutter logo](https://flutter.io/images/flutter-mark-square-100.png#100x100)

## Markdown widget

This is an example of how to create your own Markdown widget:

    new Markdown(data: 'Hello _world_!');

## Code blocks
Formatted Dart code looks really pretty too:

```
void main() {
  runApp(new MaterialApp(
    home: new Scaffold(
      body: new Markdown(data: markdownData)
    )
  ));
}
```

Enjoy!
""";

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
        title: const Text('Blog Details'),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(
        child: new Markdown(data: _markdownData),
      ),
    );
  }
}
