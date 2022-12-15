import 'package:flutter/material.dart';
import 'package:prak_mobile/theme/dark_light.dart';
import 'package:prak_mobile/view/screen/now_playing.dart';
import 'package:prak_mobile/view/screen/profile.dart';
import 'package:prak_mobile/view/screen/tv.dart';
import 'package:prak_mobile/view/screen/upcoming.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
}

class MyHomePage extends StatefulWidget {
  Function setTheme;
  final String? user;
  MyHomePage({Key? key, required this.setTheme, required this.user})
      : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeData themeData = ThemeData.light();
  bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;

  int _selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Playing(),
      Upcoming(),
      tvScreen(),
      ProfilePage(setTheme: widget.setTheme, user: widget.user)
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'INDOXINEMA',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                isDarkMode = !isDarkMode;
                widget.setTheme(isDarkMode);
              },
              icon: Icon(
                Icons.light_mode,
              ),
            ),
          ],
        ),
        body: Container(
          child: _widgetOptions[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Playing',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              label: 'Upcoming',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tv),
              label: 'Tv Series',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Profile',
              backgroundColor: Colors.blue,
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
