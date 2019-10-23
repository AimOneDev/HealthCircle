import 'package:flutter/material.dart';

class HealthTipsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HealthTipsPageState();
  }
}

class _HealthTipsPageState extends State<HealthTipsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarBuild(),
        backgroundColor: Color(0xFFF5F5F5),
        body: ListView(
          children: <Widget>[
            _tipCard(),
            _tipCard2(),
            _tipCard3(),
            _tipCard4(),
            _tipCard5(),
          ],
        ));
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
      'Health Tips',
      style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: <Widget>[
      Icon(
        Icons.clear, 
        size: 30,
      ),
    ],
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 0.0,
  );
}

Widget _tipCard() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(
      children: <Widget>[
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3hmfavls2hE0Y_WnA56TYFuzBT9ztYrcTwqXK6PGVu2VNy5Yq',),
        SizedBox(height: 20,),
        Text('Don’t drink sugar calories',style: TextStyle(fontFamily: 'Poppins',color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
        SizedBox(height: 20,),
        Text(healthTip1,style: TextStyle(fontFamily: 'Poppins',color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        SizedBox(height: 20,),
      ],
    ),
  );
}

Widget _tipCard2() {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(  
      children: <Widget>[
        Image.network('https://sipsmarter.org/wp-content/uploads/2019/02/HeartHealth-600x300.jpeg',),
        SizedBox(height: 20,),
        Text('Eat nuts',style: TextStyle(fontFamily: 'Poppins',color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
        SizedBox(height: 20,),
        Text(healthTip2,style: TextStyle(fontFamily: 'Poppins',color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        SizedBox(height: 20,),
      ],
    ),
  );
}

Widget _tipCard3() {
  return Card(
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(  
      children: <Widget>[
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGfdz81BzLwEZIEVXMUzIFYq9WOsNywLLJ94dude0c6zFLB0vZ',),
        SizedBox(height: 20,),
        Text('Avoid processed junk food',style: TextStyle(fontFamily: 'Poppins',color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
        SizedBox(height: 20,),
        Text(healthTip3,style: TextStyle(fontFamily: 'Poppins',color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        SizedBox(height: 20,),
      ],
    ),
  );
}

Widget _tipCard4() {
  return Card(
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(  
      children: <Widget>[
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQFZH-k3-8Dlems7RF6oFYkkfbyS_bZCuXXDE805bE8Zrspck5o',),
        SizedBox(height: 20,),
        Text('Lift heavy things',style: TextStyle(fontFamily: 'Poppins',color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
        SizedBox(height: 20,),
        Text(healthTip4,style: TextStyle(fontFamily: 'Poppins',color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        SizedBox(height: 20,),
      ],
    ),
  );
}

Widget _tipCard5() {
  return Card(
    
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    child: Column(  
      children: <Widget>[
        Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIMYdc-dowa2VjLchdyYKqRMkruDhk3d-wpIPv9SOkgvql41EJTw',),
        SizedBox(height: 20,),
        Text('Get enough sleep',style: TextStyle(fontFamily: 'Poppins',color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w600),textAlign: TextAlign.left,),
        SizedBox(height: 20,),
        Text(healthTip2,style: TextStyle(fontFamily: 'Poppins',color: Colors.grey,fontSize: 16, fontWeight: FontWeight.normal),textAlign: TextAlign.center),
        SizedBox(height: 20,),
      ],
    ),
  );
}


String healthTip1 ='Sugary drinks are among the most fattening items you can put into your body.This is because your brain doesn’t measure calories from liquid sugar the same way it does for solid food (1Trusted Source).';
String healthTip2 ='Despite being high in fat, nuts are incredibly nutritious and healthy.They’re loaded with magnesium, vitamin E, fiber, and various other nutrients (9).Studies demonstrate that nuts can help you lose weight and may help fight type 2 diabetes and heart disease';
String healthTip3 ='Processed junk food is incredibly unhealthy.These foods have been engineered to trigger your pleasure centers, so they trick your brain into overeating — even promoting food addiction in some people (15Trusted Source).They’re usually low in fiber, protein, and micronutrients but high in unhealthy ingredients like added sugar and refined grains. Thus, they provide mostly empty calories.';
String healthTip4 ='Lifting weights is one of the best things you can do to strengthen your muscles and improve your body composition.It also leads to massive improvements in metabolic health, including improved insulin sensitivity (84, 85).The best approach is to lift weights, but doing bodyweight exercises can be just as effective';
String healthTip5 ='The importance of getting enough quality sleep cannot be overstated.Poor sleep can drive insulin resistance, disrupt your appetite hormones, and reduce your physical and mental performance.Whats more, poor sleep is one of the strongest individual risk factors for weight gain and obesity. One study linked insufficient sleep to an 89% and 55% increased risk of obesity in children and adults, respectively.';