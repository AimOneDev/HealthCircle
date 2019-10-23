import 'package:flutter/material.dart';

import '../pages/auth.dart';

class OnboardingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OnboardingPage();
  }
}

class _OnboardingPage extends State<OnboardingPage>
    with TickerProviderStateMixin {
  PageController _controller;
  int currentPage = 0;
  bool lastPage = false;
  AnimationController animationController;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _scaleAnimation = Tween(begin: 0.2, end: 0.8).animate(animationController);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        // gradient: LinearGradient(

        //     // [Color(0xFF485563), Color(0xFF29323C)],
        //     tileMode: TileMode.clamp,
        //     begin: Alignment.topCenter,
        //     stops: [0.0, 1.0],
        //     end: Alignment.bottomCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            PageView.builder(
              itemCount: pageList.length,
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                  if (currentPage == pageList.length - 1) {
                    lastPage = true;
                    animationController.forward();
                  } else {
                    lastPage = false;
                    animationController.reset();
                  }
                  print(lastPage);
                });
              },
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    var page = pageList[index];
                    var delta;
                    var y = 1.0;

                    if (_controller.position.haveDimensions) {
                      delta = _controller.page - index;
                      y = 1 - delta.abs().clamp(0.0, 1.0);
                    }
                    return Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 127.42,
                        ),
                        Transform(
                          transform:
                              Matrix4.translationValues(0, -100.0 * (1 - y), 0),
                          child: Image.asset(
                            page.imageUrl,
                            height: 212.93,
                          ),
                        ),
                        SizedBox(
                          height: 35.65,
                        ),
                        Container(
                          // margin: EdgeInsets.only(left: 12.0),
                          height: 90.0,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    page.title,
                                    textAlign: TextAlign.center,
                                    // gradient: LinearGradient(
                                    //     colors: pageList[index].titleGradient),
                                    style: TextStyle(
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      fontFamily: "Poppins",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0, top: 12.0),
                          child: Transform(
                            transform: Matrix4.translationValues(
                                0, 100.0 * (0.7 - y), 26),
                            child: Text(
                              page.body,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: "Poppins",
                                  color: Color(0xffffffff)),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
              },
            ),
            Positioned(
              left: 130.0,
              bottom: 20.0,
              child: Container(
                  width: 100.0,
                  child: PageIndicator(currentPage, pageList.length)),
            ),
            Positioned(
              right: 10.0,
              bottom: 10.0,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: lastPage
                    ? FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage(),));
                        },
                      )
                    : Container(),
              ),
            ),
            Positioned(
              right: 10.0,
              bottom: 10.0,
              child: !lastPage
                  ? FlatButton(
                      child: Text('SKIP',
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.white)),
                      onPressed: () {},
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

var pageList = [
  PageModel(
      imageUrl: "assets/img/illu1.png",
      title: "Medical Record",
      body: "help medics access your\n medical record easier than ever",
      titleGradient: gradients[0]),
  PageModel(
      imageUrl: "assets/img/illu2.png",
      title: "Emergency or Illness",
      body:
          "Notify emergencies and your trusted \n contacts with a single voice\n command or tap ",
      titleGradient: gradients[1]),
  PageModel(
      imageUrl: "assets/img/illu3.png",
      title: "Health Feed",
      body: "Get tips trusted by doctors dedicated\n for you in a single feed",
      titleGradient: gradients[2]),
  PageModel(
      imageUrl: "assets/img/illu4.png",
      title: "Online Doctors",
      body:
          "Live stream access to doctors\n from different fields in a single tap",
      titleGradient: gradients[2]),
];

List<List<Color>> gradients = [
  [Color(0xFF9708CC), Color(0xFF43CBFF)],
  [Color(0xFFE2859F), Color(0xFFFCCF31)],
  [Color(0xFF5EFCE8), Color(0xFF736EFE)],
];

class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int pageCount;
  PageIndicator(this.currentIndex, this.pageCount);

  _indicator(bool isActive) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7.0),
        child: Container(
          height: 8.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: isActive ? Colors.white : Colors.white54,
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  _buildPageIndicators() {
    List<Widget> indicatorList = [];
    for (int i = 0; i < pageCount; i++) {
      indicatorList
          .add(i == currentIndex ? _indicator(true) : _indicator(false));
    }
    return indicatorList;
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: _buildPageIndicators(),
    );
  }
}

// import 'package:flutter/material.dart';

// class OnboardingPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _OnboardingPage();
//   }
// }

// class _OnboardingPage extends State<OnboardingPage> {

//   PageController controller;
//   int currentPage = 0;

//   @override
//   void initState() {
//     super.initState();
//   @override
//    void dispose() {
//      controller.dispose();
//      super.dispose();
//    }

//     controller = PageController(initialPage: currentPage);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Container(
//           color: Colors.blue,

//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//               PageView(
//                 controller: controller,
//                 children: <Widget>[
//                   PageOne(),
//                   Pagetwo(),
//                   Pagethree(),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//   }
// }

// class PageOne extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Container(
//           color: Colors.green,

//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[

//             ],
//           ),
//         ),
//       );
//   }
// }

// class Pagetwo extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Container(
//           color: Colors.yellow,

//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[

//             ],
//           ),
//         ),
//       );
//   }
// }

// class Pagethree extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body:
//         Container(
//           color: Colors.teal[700],

//           child: Stack(
//             fit: StackFit.expand,
//             children: <Widget>[
//              Positioned(
//                child: PageIndicator(currentIndex, pageCount.length),
//              )
//             ],
//           ),
//         ),
//       );
//   }
// }
