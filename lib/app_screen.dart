import 'package:flutter/material.dart';
import 'pfp_screen.dart';
import 'package:icons_flutter/icons_flutter.dart';

class App extends StatefulWidget {
  final List<Color> color;
  final String name, dob, gender, ai;
  final String date;
  const App(
      {Key? key,
      required this.color,
      required this.name,
      required this.dob,
      required this.gender,
      required this.ai,
      required this.date})
      : super(key: key);
  @override
  State<App> createState() => _MyAppState();
}

class _MyAppState extends State<App> {
  int _currentIndex = 0;
  late List<Widget> pages = [
    const HomeScreen(),
    const ClubScreen(),
    ProfileScreen(
      color: widget.color,
      name: widget.name,
      dob: widget.dob,
      gender: widget.gender,
      ai: widget.ai,
      date: widget.date,
    ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal AI',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  debugPrint("Notification Pressed");
                },
                icon: const Icon(
                  Icons.notifications,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
        body: pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FlutterIcons.typing_ent),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 100,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Button clicked');
                },
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                ),
                child: const Text("Activities"),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ClubScreen extends StatelessWidget {
  const ClubScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Club Screen'),
    );
  }
}
