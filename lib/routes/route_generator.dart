import 'package:flutter/material.dart';
import 'package:indagrow/screens/activity.dart';
import 'package:indagrow/screens/activity_list.dart';
import 'package:indagrow/screens/add_activity.dart';
import 'package:indagrow/screens/blog.dart';
import 'package:indagrow/screens/blog_details.dart';
import 'package:indagrow/screens/crop_list.dart';
import 'package:indagrow/screens/feed.dart';
import 'package:indagrow/screens/feed_details.dart';
import 'package:indagrow/screens/home.dart';
import 'package:indagrow/screens/login.dart';
import 'package:indagrow/screens/profile.dart';
import 'package:indagrow/screens/register.dart';
import 'package:indagrow/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushReplacementNamed
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginPage());

      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterPage());

      case '/home':
        // Validation of correct data type
        // var data = settings.arguments;
        return MaterialPageRoute(builder: (_) => HomePage());
      // If args is not of the correct type, return an error page.
      // You can also throw an exception while in development.

      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfilePage());

      case '/feed':
        return MaterialPageRoute(builder: (_) => FeedPage());

      case '/feedDetails':
        var data = settings.arguments;
        return MaterialPageRoute(builder: (_) => FeedDetailsPage());

      case '/blog':
        return MaterialPageRoute(builder: (_) => BlogPage());

      case '/blogDetails':
        return MaterialPageRoute(builder: (_) => BlogDetailsPage());
        
      case '/activity':
        return MaterialPageRoute(builder: (_) => ActivityPage());
        
      case '/activityList':
        return MaterialPageRoute(builder: (_) => ActivityListPage());
        
      case '/addActivity':
        return MaterialPageRoute(builder: (_) => AddActivityPage());
        
      case '/cropList':
        return MaterialPageRoute(builder: (_) => CropListPage());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
