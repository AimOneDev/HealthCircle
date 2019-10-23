import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './addmedrec.dart';
import '../models/medicalrec.dart';

class VitalInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VitalInfoPageState();
  }
}

class _VitalInfoPageState extends State<VitalInfoPage> {
  List<MedicalRecord> _medicalRec = [];
  @override
  initState() {
    _fetchMedRec();
    super.initState();
  }

  void _addMedRec(String name, String description, String date) {
    Map<String, dynamic> medrecData = {
      'title': name,
      'comment': description,
      'date': date,
    };
    http
        .post('https://health-circles.firebaseio.com/medicalrecords.json',
            body: json.encode(medrecData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final MedicalRecord medRec = MedicalRecord(
        id: responseData['name'],
        medicalRecord: name,
        comment: description,
        date: date,
      );
      setState(() {
        _medicalRec.add(medRec);
      });
      // print(medRec);
    });
  }

  void _fetchMedRec() {
    http.get('https://health-circles.firebaseio.com/medicalrecords.json').then(
      (http.Response response) {
        //print(json.decode(response.body));
        final List<MedicalRecord> fetchedMedRecList = [];
        Map<String, dynamic> medrecListData = json.decode(response.body);
        medrecListData.forEach((String medRecID, dynamic medrecData) {
          final MedicalRecord medRec = MedicalRecord(
            id: medRecID,
            medicalRecord: medrecData['title'],
            comment: medrecData['comment'],
            date: medrecData['date'],
          );
          fetchedMedRecList.add(medRec);
        });
        setState(() {
          _medicalRec = fetchedMedRecList;
        });
      },
    );
  }

  List<MedicalRecord> get displayedMedRecs {
    return List.from(_medicalRec);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddMedicalRecord(_addMedRec),
            ),
          );
        },
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: _medRecordBody(),
      ),
    );
  }

  Widget _buildMedRecList(List<MedicalRecord> medRecord) {
    Widget medRecCard;
    if (medRecord.length > 0) {
      medRecCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            MedReccard(medRecord[index], index),
        itemCount: medRecord.length,
      );
    } else {
      medRecCard = Center(
        child: CircularProgressIndicator(),
      );
    }
    return medRecCard;
  }

  Widget _appBarBuild() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      title: Text(
        'Vital Conditions',
        style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Poppins',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
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

  Widget _medRecordBody() {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
          //height: 50,
        ),
        Expanded(
          child: _buildMedRecList(displayedMedRecs),
        )
      ],
    ));
  }
}

class MedReccard extends StatelessWidget {
  final MedicalRecord medRec;
  final int medRecIndex;

  MedReccard(this.medRec, this.medRecIndex);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('d'),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              medRec.medicalRecord,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            // Text(
            //   medRec.date,
            //   style: TextStyle(
            //       fontFamily: 'Poppins',
            //       color: Colors.grey,
            //       fontSize: 16,
            //       fontWeight: FontWeight.normal),
            //   textAlign: TextAlign.left,
            // ),
            Text(
              medRec.comment,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        //height: 127,
        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.blue[100],
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
}
