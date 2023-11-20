import 'package:flutter/material.dart';
import 'app_screen.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  final List<Color> color;
  const LoginScreen({Key? key, required this.color}) : super(key: key);

  @override
  State<LoginScreen> createState() => _UserInfoState();
}

class _UserInfoState extends State<LoginScreen> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateTime currentDate = DateTime.now();
    final String date = DateFormat('dd/MM/yyyy').format(currentDate);
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Personal AI',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.purple,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            Icons.security,
                            color: widget.color[0],
                            size: 32,
                          ),
                          const Center(
                              child: Text(
                            'Under Cover',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller2,
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8.0),
                        icon: Icon(
                          FlutterIcons.id_badge_faw,
                          color: widget.color[0],
                        ),
                        label: const Text(
                          'Agent Code',
                        ),
                        hintText: 'Code',
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _controller3,
                    decoration: InputDecoration(
                        icon: Icon(
                          FlutterIcons.textbox_password_mco,
                          color: widget.color[0],
                        ),
                        label: const Text(
                          'Password',
                        ),
                        hintText: 'Password',
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                ((context, animation, secondaryAnimation) =>
                                    App(
                                      color: widget.color,
                                      name: _controller1.text,
                                      dob: _controller2.text,
                                      gender: _controller3.text,
                                      ai: _controller4.text,
                                      date: date,
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
                              var offsetAnimation = animation.drive(tween);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            }),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20.0),
                        backgroundColor: widget.color[0],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
