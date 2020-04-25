import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: Text(
                  "Following",
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
                ),
              ),
              Container(
                height: 80.0,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    User user = users[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(10.0),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            user.profileImageUrl,
                            height: 60.0,
                            width: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: users.length,
                ),
              ),
            ],
          );
  }
}