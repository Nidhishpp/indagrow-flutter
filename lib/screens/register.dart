import 'package:flutter/material.dart';
import 'package:indagrow/routes/network_routes.dart';
import 'package:indagrow/utils/auth_utils.dart';
import 'package:indagrow/utils/function_utils.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final String logo = 'assets/images/logo-white.png';
  final String bg = 'assets/images/bg3.jpg';

  TextEditingController _nameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _dobController;
  TextEditingController _addresslineController;
  TextEditingController _landmarkController;
  TextEditingController _cityController;
  TextEditingController _stateController;
  TextEditingController _countryController;
  TextEditingController _pincodeController;
  Widget _buttonLoader;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage(bg),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 20.0,
                    ),
                    height: 80,
                    child: Image.asset(logo),
                  ),
                  Text(
                    'Register'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextField(
                    controller: _nameController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Name',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    maxLength: 10,
                    controller: _emailController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.phone,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Mobile No',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.lock,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _dobController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Date of Birth',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _addresslineController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Address line',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _landmarkController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Landmark',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _cityController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your City',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _stateController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your State',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _countryController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your Country',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: _pincodeController,
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16.0),
                      prefixIcon: Container(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        margin: const EdgeInsets.only(right: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                            bottomRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                      hintText: 'Enter your PinCode',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.1),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  AnimatedSwitcher(
                    duration: Duration(seconds: 1),
                    child: _buttonLoader,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _dobController = TextEditingController();
    _addresslineController = TextEditingController();
    _landmarkController = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _countryController = TextEditingController();
    _pincodeController = TextEditingController();
    setState(() => _buttonLoader = _loginButton());
  }

  Future<void> _register() async {
    setState(() => _buttonLoader = CircularProgressIndicator(strokeWidth: 4.0));
    var jsonData = await APIRoutes.register(
        _emailController.text,
        _passwordController.text,
        _nameController.text,
        _dobController.text,
        _addresslineController.text,
        _landmarkController.text,
        _cityController.text,
        _stateController.text,
        _countryController.text,
        _pincodeController.text);
    try {
      print(jsonData.toString());
      if (jsonData['status'] != 'error') {
        // _scaffoldKey.currentState.showSnackBar(
        //   SnackBar(
        //     content: Text("logged in"),
        //     duration: Duration(seconds: 3),
        //   ),
        // );
        // Navigator.of(context).pushReplacementNamed(
        //   '/home',
        //   arguments: 'Team 1',
        // );
        Navigator.of(context).pushNamed('/login');
      } else {
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(jsonData['message'].toString()),
            duration: Duration(seconds: 3),
          ),
        );
      }

      setState(() => _buttonLoader = _loginButton());
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text('Error logging in'),
          duration: Duration(seconds: 3),
        ),
      );

      setState(() => _buttonLoader = _loginButton());
    }
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        textColor: Colors.green,
        color: Colors.white,
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'Register'.toUpperCase(),
        ),
        onPressed: () {
          if (_valid()) {
            _register();
            // Navigator.of(context).pushReplacementNamed('/home');
          } else {
            _scaffoldKey.currentState.showSnackBar(
              SnackBar(
                content: Text('Please check your Login Credential'),
                duration: Duration(seconds: 3),
              ),
            );
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  bool _valid() {
    bool isValid = true;
    if (_emailController.text == null || _emailController.text == "") {
      isValid = false;
    } else if (_passwordController.text == null ||
        _passwordController.text == "") {
      isValid = false;
    } else if (_nameController.text == null || _nameController.text == "") {
      isValid = false;
    } else if (_dobController.text == null || _dobController.text == "") {
      isValid = false;
    } else if (_addresslineController.text == null ||
        _addresslineController.text == "") {
      isValid = false;
    } else if (_landmarkController.text == null ||
        _landmarkController.text == "") {
      isValid = false;
    } else if (_cityController.text == null || _cityController.text == "") {
      isValid = false;
    } else if (_stateController.text == null || _stateController.text == "") {
      isValid = false;
    } else if (_countryController.text == null ||
        _countryController.text == "") {
      isValid = false;
    } else if (_pincodeController.text == null ||
        _pincodeController.text == "") {
      isValid = false;
    }
    return isValid;
  }
}
