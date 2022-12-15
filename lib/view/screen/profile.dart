import 'package:prak_mobile/login_page.dart';
import 'package:prak_mobile/theme/theme.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  Function setTheme;
  final String? user;
  ProfilePage({Key? key, required this.setTheme, required this.user}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double coverHeight = 280;
  double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
              margin: EdgeInsets.only(
                bottom: 80,
              ),
              child: buildTop()),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        coverImage(),
        Positioned(
          top: top,
          child: profileImage(),
        ),
      ],
    );
  }

  Widget buildContent() => Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            widget.user ?? "-",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Hallo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 120,
          ),
          TextButton(
            child: Text(
              'Logout',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: TextButton.styleFrom(
              backgroundColor: Color.fromRGBO(49, 39, 79, 1),
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(setTheme: widget.setTheme),
                ),
              );
            },
          ),
          SizedBox(
            height: 40,
          )
        ],
      );

  Widget coverImage() => Container(
        color: Colors.grey,
        child: Image(
          image: AssetImage('assets/images.png'),
          width: double.infinity,
          height: coverHeight,
          fit: BoxFit.cover,
        ),
      );

  Widget profileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: AssetImage('assets/profile.png'),
      );
}