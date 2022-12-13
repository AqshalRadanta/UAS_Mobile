import 'package:flutter/material.dart';
import 'package:prak_mobile/theme/dark_light.dart';
import 'package:prak_mobile/view/screen/now_playing.dart';
import 'package:prak_mobile/view/screen/tv.dart';
import 'package:prak_mobile/view/screen/upcoming.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
}

class MyHomePage extends StatefulWidget {
  Function setTheme;
  MyHomePage({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ThemeData themeData = ThemeData.light();
  bool isDarkMode = SharedPref.pref?.getBool('isDarkMode') ?? false;

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Playing(),
    Upcoming(),
    tvScreen(),
  ];

  @override
  Widget build(BuildContext context) {
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
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color.fromARGB(255, 65, 91, 234),
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
