import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'intro_screen.dart';
import 'package:icons_flutter/icons_flutter.dart';

class CardFlip extends StatefulWidget {
  final List<Color> color;
  final Color col;
  final String name;
  final String dob;
  final String gender;
  final String ai;
  final String date;
  final String msg;
  final String ttl;
  final int k;
  final List<String> logoutmsg;
  const CardFlip({
    Key? key,
    required this.color,
    required this.name,
    required this.dob,
    required this.gender,
    required this.ai,
    required this.date,
    required this.msg,
    required this.ttl,
    required this.logoutmsg,
    required this.col,
    required this.k,
  }) : super(key: key);

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip> {
  final TextEditingController _controller = TextEditingController();
  late String aiAlias;
  @override
  void initState() {
    super.initState();
    aiAlias = widget.ai;
  }

  void setAlias() {
    setState(() {
      aiAlias = _controller.text;
    });
  }

  Future<dynamic> mainpage() {
    return Navigator.push(
      context,
      PageRouteBuilder(
          pageBuilder: ((context, animation, secondaryAnimation) =>
              const IntroScreen()),
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          }),
    );
  }

  Future<dynamic> changeAlias() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Icon(
                FlutterIcons.edit_mdi,
                size: 30,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                    icon: Icon(
                      FlutterIcons.robot_mco,
                      color: Colors.white,
                    ),
                    label: Text(
                      'AI alias',
                    ),
                    hintText: 'Alias',
                    border: OutlineInputBorder()),
              ),
            ],
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 80),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  setAlias();
                },
                child: const Text(
                  'Change',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: widget.color[0],
        );
      },
    );
  }

  Future<dynamic> dialogueBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: [
              const Icon(
                FlutterIcons.power_mco,
                size: 30,
              ),
              Text(
                widget.logoutmsg[0],
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                    color: Colors.white),
              ),
            ],
          ),
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(width: 25),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  if (widget.k == 0) {
                    Navigator.of(context).pop();
                    mainpage();
                  } else {
                    Navigator.of(context).pop();
                    changeAlias();
                  }
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 50),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white30),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          backgroundColor: widget.color[0],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double hgt = (MediaQuery.of(context).size.height) * 0.05;
    return Column(
      children: [
        const SizedBox(height: 80),
        Container(
          padding: const EdgeInsets.all(8.0),
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.height * 0.6,
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL,
            flipOnTouch: true,
            front: Card(
              color: widget.col,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: hgt),
                      Center(
                          child: Text(
                        widget.ttl,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(255, 215, 0, 1)),
                      )),
                      const SizedBox(height: 50),
                      Center(
                          child: Text(
                        'Alias: ${widget.k == 0 ? widget.name : aiAlias}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                      const SizedBox(height: 10),
                      Center(
                          child: Text(
                        'Onset: ${widget.k == 0 ? widget.dob : widget.date}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      )),
                      const SizedBox(height: 10),
                      Center(
                          child: Text(
                        'Gender: ${widget.k == 0 ? widget.gender : 'Robot'}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      )),
                      const SizedBox(height: 40),
                      Icon(
                        widget.k == 0
                            ? FlutterIcons.md_person_ion
                            : FlutterIcons.robot_mco,
                        size: 50,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          dialogueBox();
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white30),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0),
                            ))),
                        child: Text(
                          widget.logoutmsg[1],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  )),
            ),
            back: Card(
              color: widget.col,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widget.msg),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
