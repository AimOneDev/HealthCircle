import 'package:flutter/material.dart';

import './emergencycontacts.dart';
import '../models/contacts.dart';

class AddEmergencyContactsPage extends StatefulWidget {
  final Function _addEmeContact;

  AddEmergencyContactsPage(this._addEmeContact);

  @override
  State<StatefulWidget> createState() {
    return _AddEmergencyContactsPageState();
  }
}

class _AddEmergencyContactsPageState extends State<AddEmergencyContactsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'name': null,
    'number': null,
    'adresse': null,
  };
  String name;
  String number;
  String adresse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: _medRecordCard(),
      ),
    );
  }

  void _submitForm() {
    _formKey.currentState.save();
    widget._addEmeContact(
      _formData['name'],
      _formData['number'],
      _formData['adresse'],
    );
    Navigator.pop(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => EmergencyContactsPage()),
    );
  }

  Widget _appBarBuild() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      centerTitle: true,
      actions: <Widget>[
        Icon(
          Icons.search,
          size: 30,
        ),
      ],
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0.0,
    );
  }

  Widget _medRecordCard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            _buildContactName(),
            SizedBox(
              height: 20.0,
            ),
            _buildContactNumber(),
            SizedBox(
              height: 20.0,
            ),
            _buildContactAdresse(),
            SizedBox(
              height: 70.0,
            ),
            _buildButton(),
          ],
        ),
      ),
      //height: 127,
      margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(33.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            offset: Offset(0.0, 0.0),
          ),
        ],
      ),
    );
  }

  Widget _buildContactName() {
    return TextFormField(
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
          prefixIcon: Icon(Icons.add),
          //helperText: 'call it up ',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
              gapPadding: 5.0,
              borderSide: BorderSide(style: BorderStyle.solid)),
          labelText: 'Contact Name'),
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 10,
          fontWeight: FontWeight.normal),
      onSaved: (String value) {
        _formData['name'] = value;
        // we do not need set state in forms
      },
    );
  }

  Widget _buildContactNumber() {
    return TextFormField(
      initialValue: null,
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'required and should be 5+ chars long';
        }
      },

      ///maxLines: 6,
      scrollPadding: const EdgeInsets.all(20.0),
      //autocorrect: true,
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 10,
          fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
              gapPadding: 0,
              borderSide: BorderSide()),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          labelText: 'Contact Number'),

      onSaved: (String value) {
        _formData['number'] = value;
        // we do not need set state in forms
      },
    );
  }

  Widget _buildContactAdresse() {
    return TextFormField(
      initialValue: null,
      //autovalidate: true,
      validator: (String value) {
        if (value.isEmpty || value.length < 5) {
          return 'required and should be 5+ chars long';
        }
      },

      ///maxLines: 6,
      scrollPadding: const EdgeInsets.all(20.0),
      //autocorrect: true,
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 10,
          fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(30, 30)),
              gapPadding: 0,
              borderSide: BorderSide()),
          //border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
          labelText: 'Contact Number'),

      onSaved: (String value) {
        _formData['adresse'] = value;
        // we do not need set state in forms
      },
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
      child: Material(
        borderRadius:
            BorderRadius.circular(30.0), //Set this up for rounding corners.
        shadowColor: Colors.lightBlueAccent.shade100,
        child: RaisedButton(
          child: Text(
            'SUBMIT',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.normal),
          ),
          textColor: Colors.white,
          color: Colors.blue,
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0)),
          padding: EdgeInsets.symmetric(vertical: 5.0),
          //animationDuration: Duration(seconds: 1),
          //materialTapTargetSize: MaterialTapTargetSize.padded,
          onPressed: () {
            _submitForm();
          },
        ),
      ),
    );
  }
}
