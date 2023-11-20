import 'dart:math';
import 'package:esc_r00m/user.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:icons_flutter/icons_flutter.dart';

List<Color> generate() {
  final random = Random();
  return List.generate(
      1,
      (_) => Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          ));
}

List<Color> current = generate();

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  List<Color> currentEffect = effectGenerator();
  static List<Color> effectGenerator() {
    final random = Random();
    return List.generate(
        1,
        (_) => Color.fromRGBO(
              random.nextInt(256),
              random.nextInt(256),
              random.nextInt(256),
              1,
            ));
  }

  void regenerate() {
    setState(() {
      currentEffect = effectGenerator();
      currentEffect[0] = const Color(0xffb267d1);
    });
  }

  @override
  Widget build(BuildContext context) {
    current[0] = const Color(0xffb267d1);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Personal AI',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 20,
              child: AnimatedContainer(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2.1,
                duration: const Duration(milliseconds: 500),
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      const Icon(
                        FlutterIcons.robot_mco,
                        size: 50,
                      ),
                      const Text(
                        'AI',
                        style: TextStyle(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Color(0xffb267d1)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: ((context, animation,
                                            secondaryAnimation) =>
                                        LoginScreen(
                                          color: current,
                                        )),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 30),
                                padding: const EdgeInsets.all(20.0),
                                backgroundColor: current[0],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            child: const Text(
                              "Agent",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                          const SizedBox(width: 50),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: ((context, animation,
                                            secondaryAnimation) =>
                                        UserInfo(
                                          color: current,
                                        )),
                                    transitionsBuilder: (
                                      context,
                                      animation,
                                      secondaryAnimation,
                                      child,
                                    ) {
                                      const begin = Offset(1.0, 0.0);
                                      const end = Offset.zero;
                                      const curve = Curves.easeInOut;
                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);
                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    }),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 30),
                                padding: const EdgeInsets.all(20.0),
                                backgroundColor: current[0],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            child: const Text(
                              "Rookie",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
