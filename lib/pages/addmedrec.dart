import 'package:flutter/material.dart';

import './medicalrecord.dart';
import '../models/medicalrec.dart';

class AddMedicalRecord extends StatefulWidget {
  final Function addMedRec;

  AddMedicalRecord(this.addMedRec);

  @override
  State<StatefulWidget> createState() {
    return _AddMedicalRecordPageState();
  }
}

class _AddMedicalRecordPageState extends State<AddMedicalRecord> {
  final Map<String, dynamic> _formData = {
    'name': null,
    'description': null,
    'date': '2019.07.01',
  };

  String medRecValue;
  String dateValue = '2019.07.01';
  String descriptionValue;
  final GlobalKey<FormState> _medRecFormKey = GlobalKey<FormState>();

  // final Map<String, String> _formValue = {
  //   'medicalRecord': null,
  // };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: _medRecordCard(_medRecFormKey),
      ),
    );
  }

  void _submitForm() {
    _medRecFormKey.currentState.save();

    widget.addMedRec(
      _formData['name'],
      _formData['description'],
      _formData['date'],
    );
    Navigator.pop(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => MedRecordPage(),
      ),
    );
  }

  Widget _medRecordCard(GlobalKey<FormState> formKey) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            _buildMedRecName(),
            SizedBox(
              height: 20.0,
            ),
            _buildMedRecComment(),
            SizedBox(
              height: 80.0,
            ),
            _buildButton(),
          ],
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
      ),
    );
  }

  Widget _buildMedRecName() {
    return TextFormField(
      initialValue: null,
      //autovalidate: true,
      // validator: (String value) {
      //   if (value.isEmpty || value.length < 5) {
      //     return 'required and should be 5+ chars long';
      //   }
      // },
      scrollPadding: const EdgeInsets.all(20.0),
      autocorrect: true,

      decoration: InputDecoration(
          prefixIcon: Icon(Icons.add),
          //helperText: 'call it up ',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(26, 26)),
              gapPadding: 5.0,
              borderSide: BorderSide(style: BorderStyle.solid)),
          labelText: 'Medical Record Name'),
      style: TextStyle(
          fontFamily: 'Poppins',
          color: Colors.grey,
          fontSize: 10,
          fontWeight: FontWeight.normal),
      onSaved: (String value) {
        // we do not need set state in forms
        setState(() {
          _formData['name'] = value;
        });
      },
    );
  }

  Widget _buildMedRecComment() {
    return TextFormField(
      initialValue: null,
      //autovalidate: true,
      // validator: (String value) {
      //   if (value.isEmpty || value.length < 5) {
      //     return 'required and should be 5+ chars long';
      //   }
      // },
      maxLines: 6,
      scrollPadding: const EdgeInsets.all(20.0),
      autocorrect: true,
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
          labelText: 'Medical Record Name'),

      onSaved: (String value) {
        setState(() {
          _formData['description'] = value;
        });
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
