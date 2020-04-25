import 'package:flutter/material.dart';
import 'package:socialmediaapp/models/user_model.dart';
import 'package:socialmediaapp/widgets/custom_drawer.dart';
import 'package:socialmediaapp/widgets/posts_carousel.dart';
import 'package:socialmediaapp/widgets/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;
  ProfileScreen({
    this.user,
  });

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffolKey = GlobalKey<ScaffoldState>();
  PageController _yourPostsPageController;
  PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _yourPostsPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75,
    );
    _favoritesPageController = PageController(
      initialPage: 0,
      viewportFraction: 0.75,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffolKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image.asset(
                    widget.user.backgroundImageUrl,
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 20.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30.0,
                      color: Colors.white,
                    ),
                    onPressed: () => _scaffolKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 6.0,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        widget.user.profileImageUrl,
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(13.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: 25.0,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Following",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Followers",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: "Your Posts",
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: "Favorites",
              posts: widget.user.favorites,
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
