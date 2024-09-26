import 'dart:async';

import 'package:flutter/material.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  State<TimerPage> createState() => _TimerPageState();
}

DateTime startTime = DateTime.now(), stopTime = DateTime.now();

bool start = true, stop = false, pause = false;

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${stopTime.difference(startTime)}',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              start
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          startTime = DateTime.now();
                          start = false;
                          stop = true;
                        });
                      },
                      icon: circleContainer(
                          text: 'Start', color: Colors.green, padding: 15),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              stopTime = DateTime.now();
                              start = true;
                              stop = true;
                              print('|||| time difference |||||||');
                              print(stopTime.difference(startTime));
                            });
                          },
                          icon: circleContainer(
                              color: Colors.red, text: 'Stop', padding: 15),
                        ),
                        SizedBox(width: 25),
                        pause
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    pause = false;
                                  });
                                },
                                icon: circleContainer(
                                    text: 'Resume',
                                    color: Colors.green,
                                    padding: 15),
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    pause = true;
                                  });
                                },
                                icon: circleContainer(
                                    text: 'Pause',
                                    color: Colors.yellow,
                                    padding: 15),
                              ),
                      ],
                    ),
            ],
          ),
          SizedBox(height: 25),
          stop
              ? const SizedBox()
              : TextButton(
                  onPressed: () {},
                  child: circleContainer(
                      text: 'Save', color: Colors.green, padding: 25),
                )
        ],
      )),
    );
  }

  circleContainer(
      {required String text, required Color color, required double padding}) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
