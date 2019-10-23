library avatar_glow;

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import './url_launcher.dart';

class Distress extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DistressState();
  }
}

class _DistressState extends State<Distress> {

  _launchURL() async {
  const url = 'tel:14';
 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }

  void _sendSMS(String message, List<String> recipents) async {
  String _result = await FlutterSms
        .sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
  print(_result);
  }
  String message = "This is a test message!";
  List<String> recipents = ["1234567890", "5556787676"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      backgroundColor: Color(0xFFF5F5F5),
      body: Center(
        //heightFactor: 50,
        child: Container(
          //padding: EdgeInsets.all(20),
          color: Color(0xFFF5F5F5),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              //_distressCard(context),
              AvatarGlow(
                startDelay: Duration(milliseconds: 100),
                glowColor: Colors.blue,
                endRadius: 120.0,
                duration: Duration(milliseconds: 1000),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: Duration(milliseconds: 100),
                child: Material(
                  elevation: 8.0,
                  shape: CircleBorder(),
                  child: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      child: Image.asset(
                        'assets/img/distress.png',
                        height: 70,
                      ),
                      radius: 60.0,
                    ),
                    onTap: _launchURL,
                  ),
                ),
              ),

              // RaisedButton(
              //   child: Text('btn'),
              //   onPressed: () {
              //      _sendSMS(message, recipents); 
              //   },
              // ),
              
              Text(
                'Send a Distress\n Call NOW !',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appBarBuild() {
  return AppBar(
    // leading: Icon(
    //   Icons.menu,
    //   color: Colors.blue,
    // ),
    iconTheme: IconThemeData(color: Colors.blue),
    title: Text(
      'Distress Alert',
      style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: <Widget>[
      // Icon(
      //   Icons.search,
      //   //color: Colors.blue,
      //   size: 30,
      // ),
    ],
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 0.0,
  );
}

Widget _distressCard(BuildContext context) {
  return GestureDetector(
    onTap: () {
      //Navigator.pushNamed(context, '/medrec');
    },
    child: Container(
      height: 250,
      width: 200,
      child: Column(
        children: <Widget>[
          Image.asset('assets/img/distress.png', height: 80, width: 80),
          SizedBox(
            height: 20,
          ),
          Text(
            'Send Distress\n Call NOW !',
            style: TextStyle(
                fontFamily: 'Poppins', color: Colors.blue, fontSize: 18),
            textAlign: TextAlign.center,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
            //spreadRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
    ),
  );
}

class AvatarGlow extends StatefulWidget {
  final bool repeat;
  final Duration duration;
  final double endRadius;
  final Duration repeatPauseDuration;
  final Widget child;
  final bool showTwoGlows;
  final Color glowColor;
  final Duration startDelay;

  AvatarGlow({
    @required this.endRadius,
    @required this.child,
    this.duration,
    this.repeat = true,
    this.repeatPauseDuration,
    this.showTwoGlows = true,
    this.glowColor,
    this.startDelay,
  });

  @override
  _AvatarGlowState createState() => _AvatarGlowState();
}

class _AvatarGlowState extends State<AvatarGlow>
    with SingleTickerProviderStateMixin {
  Animation<double> smallDiscAnimation;
  Animation<double> bigDiscAnimation;
  Animation<double> alphaAnimation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: widget.duration ?? Duration(milliseconds: 2000), vsync: this);
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.decelerate);
    smallDiscAnimation = Tween(
            begin: (widget.endRadius * 2) / 6,
            end: (widget.endRadius * 2) * (3 / 4))
        .animate(curve)
          ..addListener(() {
            setState(() {});
          });
    bigDiscAnimation =
        Tween(begin: 0.0, end: (widget.endRadius * 2)).animate(curve)
          ..addListener(() {
            setState(() {});
          });
    alphaAnimation = Tween(begin: 0.30, end: 0.0).animate(controller);
    controller.addStatusListener((_) async {
      if (controller.status == AnimationStatus.completed) {
        await Future.delayed(
            widget.repeatPauseDuration ?? Duration(milliseconds: 100));
        if (mounted && widget.repeat) {
          controller.reset();
          controller.forward();
        }
      }
    });
    startAnimation();
  }

  void startAnimation() async {
    if (widget.startDelay != null) {
      await Future.delayed(widget.startDelay);
      if (mounted) controller.forward();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.endRadius * 2,
      width: widget.endRadius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            height: bigDiscAnimation.value,
            width: bigDiscAnimation.value,
            child: SizedBox(),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.glowColor ?? Colors.white)
                  .withOpacity(alphaAnimation.value),
            ),
          ),
          widget.showTwoGlows
              ? Container(
                  height: smallDiscAnimation.value,
                  width: smallDiscAnimation.value,
                  child: SizedBox(),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (widget.glowColor ?? Colors.white)
                        .withOpacity(alphaAnimation.value),
                  ),
                )
              : SizedBox(
                  height: 0.0,
                  width: 0.0,
                ),
          widget.child,
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class FlutterSms {
  static const MethodChannel _channel = const MethodChannel('flutter_sms');

  static Future<String> sendSMS({
    @required String message,
    @required List<String> recipients,
  }) async {
    var mapData = Map<dynamic, dynamic>();
    mapData["message"] = message;
    if (Platform.isIOS) {
      mapData["recipients"] = recipients;
      final String result = await _channel.invokeMethod('sendSMS', mapData);
      return result;
    } else {
      String _phones = recipients.join(",");
      mapData["recipients"] = _phones;
      final String result = await _channel.invokeMethod('sendSMS', mapData);
      return result;
    }
  }

  static Future<bool> canSendSMS() async {
    final bool result = await _channel.invokeMethod('canSendSMS');
    return result;
  }
}