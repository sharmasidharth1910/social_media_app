import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/screens/home_screen.dart';
import 'package:socialmediaapp/screens/login_screen.dart';
import 'package:socialmediaapp/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  _buildDrawerOption(Icon icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset(
                currentUser.backgroundImageUrl,
                height: 200.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 3.0,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          currentUser.profileImageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 25.0,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          _buildDrawerOption(
            Icon(Icons.dashboard),
            "Home",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.chat),
            "Chat",
            () {},
          ),
          _buildDrawerOption(
            Icon(Icons.location_on),
            "Map",
            () {},
          ),
          _buildDrawerOption(
            Icon(Icons.account_circle),
            "Your Profile",
            () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(
                  user: currentUser,
                ),
              ),
            ),
          ),
          _buildDrawerOption(
            Icon(Icons.settings),
            "Settings",
            () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                Icon(Icons.directions_run),
                "Logout",
                () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
