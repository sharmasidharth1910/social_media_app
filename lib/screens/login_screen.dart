import 'package:flutter/material.dart';
import 'package:socialmediaapp/screens/home_screen.dart';
import 'package:socialmediaapp/widgets/curve_clipper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              ClipPath(
                clipper: CurveClipper(),
                child: Image.asset(
                  "assets/images/login_background.jpg",
                  height: MediaQuery.of(context).size.height / 2.5,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Text(
                "FRENZY",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 10.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Username",
                    prefixIcon: Icon(
                      Icons.account_box,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                ),
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(
                    horizontal: 60.0,
                  ),
                  height: 45.0,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      color: Theme.of(context).primaryColor,
                      height: 60.0,
                      child: Text(
                        "Don't have an account? Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
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
