import 'package:flutter/material.dart';

import '../pages/Register.dart';
import '../pages/homepage.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<AuthPage> {

   final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          registerNow(context),
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(0),
              height: 250,
              color: Colors.blue,
            ),
          ),
          Positioned(
            top: 80,
            right: 21,
            left: 21,
            child: Container(
              alignment: FractionalOffset.center,
              //child: cardContent,
              height: 470.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(33.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20.0,
                    offset: Offset(0.0, 3.0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 105,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/img/healthcircle.png',
              height: 90,
              width: 90,
            ),
          ),
          Positioned(
            top: 210,
            right: 50,
            left: 50,
            child:Form(
                key: _formKey,
                child: Column(
              children: <Widget>[
                Text(
                  'Sign in your account to access\n our services',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 30.0,
                ),
                _buildName(),
                SizedBox(
                  height: 20.0,
                ),
                _buildPassword(),
                SizedBox(
                  height: 10.0,
                ),
                _buildButton(context),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildName() {
  return Container(
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(0.0, 3.0),
        ),
      ],
    ),
    child: TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: null,
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'Please enter a valid email';
        }
      },
      scrollPadding: const EdgeInsets.all(20.0),
      autocorrect: true,

      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          fillColor: Colors.white,
          filled: true,
          //helperText: 'call it up ',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
            borderSide: BorderSide(
                style: BorderStyle.solid, width: 1, color: Colors.blue),
          ),
          hasFloatingPlaceholder: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
            borderSide: BorderSide(
                style: BorderStyle.solid, width: 1, color: Colors.transparent),
          ),
          // border: OutlineInputBorder(
          //     //borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
          //     //gapPadding: 5.0,
          //     borderSide: BorderSide(style: BorderStyle.solid, width: 4, color: Colors.green),
          //     ),
          labelText: 'E-mail'),
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      onSaved: (String value) {
         _formData['email'] = value;
      },
    ),
  );
  }

  Widget _buildPassword() { 
  return Container(
    decoration: BoxDecoration(
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.black12,
          blurRadius: 15.0,
          offset: Offset(0.0, 3.0),
        ),
      ],
    ),
    child: TextFormField(
      obscureText: true,
      initialValue: null,
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'required and should be 5+ chars long';
        }
      },
      scrollPadding: const EdgeInsets.all(20.0),
      autocorrect: true,

      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          prefixIcon: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          fillColor: Colors.white,
          filled: true,
          //helperText: 'call it up ',
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
            borderSide: BorderSide(
                style: BorderStyle.solid, width: 1, color: Colors.blue),
          ),
          hasFloatingPlaceholder: false,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
            borderSide: BorderSide(
                style: BorderStyle.solid, width: 1, color: Colors.transparent),
          ),
          // border: OutlineInputBorder(
          //     //borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
          //     //gapPadding: 5.0,
          //     borderSide: BorderSide(style: BorderStyle.solid, width: 4, color: Colors.green),
          //     ),
          labelText: 'Password'),
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 14,
          fontWeight: FontWeight.normal),
      onSaved: (String value) {
         _formData['password'] = value;
      },
    ),
  );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage(),));
    
  }

  Widget _buildButton(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
    child: Material(
      borderRadius: BorderRadius.circular(30.0),
      shadowColor: Colors.lightBlueAccent.shade100,
      child: RaisedButton(
        child: Text(
          'LOGIN',
          style: TextStyle(
              fontFamily: 'Poppins',
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.normal),
        ),
        textColor: Colors.white,
        color: Colors.blue,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(20.0)),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
        //animationDuration: Duration(seconds: 1),
        //materialTapTargetSize: MaterialTapTargetSize.padded,
        onPressed: () => _submitForm(),
      ),
    ),
  );
  }

  Widget registerNow(BuildContext context) {
  return Positioned(
    top: 590,
    right: 0,
    left: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Don’t have an account?',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        GestureDetector(
          child: Text(
            'Register now!',
            style: TextStyle(
              fontSize: 15,
              fontFamily: 'Poppins',
              color: Colors.blue,
            ),
          ),
          onTap: () =>  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegisterPage(),)),
        )
      ],
    ),
  );
}
}

