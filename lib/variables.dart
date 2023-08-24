import 'package:flutter/material.dart';
// UUIDS

const Map<String, String> allowedUUIDs = {
  'beb5483e-36e1-4688-b7f5-ea07361b26a8': 'Heart Rate',
  '8bdf0a1a-a48e-4dc3-8bab-ad0c1f7ed218': 'Temperature',
  '411fcc1c-e7a5-4a61-82fe-0004993dd1f4': 'SP02',
  'c608f523-aa19-40d1-8359-ad43409c34d7': 'Systolic Preasure',
  '52294b4d-d66e-4d68-9782-1e5bb8f7ba14': 'Diastolic Preasure',
  '7533653f-6f0e-41fa-8fa6-9892a1904db1': 'Frecuency',
  '607a2edc-007d-4d51-a3a6-58fad0db3c37': 'CO2',
  'aea7aac8-5a97-488e-bd01-4166d22ec81e': 'Timer',
  '2a1c9f0b-78c4-4e0f-adc1-5dea4a248344': 'State',
};

//Start Estilos de texto
const TextStyle timeLabel = TextStyle(
  fontSize: 25.0,
  color: Colors.black,
);

const TextStyle signaLabel = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
);

const TextStyle titleLabel = TextStyle(
  fontSize: 18.0,
  color: Colors.black,
);

const TextStyle labelStyle = TextStyle(
  fontSize: 16.0,
);

const TextStyle nameTime = TextStyle(
  fontSize: 40.0,
  color: Colors.black,
);

const TextStyle numTime = TextStyle(
  fontSize: 65.0,
  color: Colors.black54,
);

const TextStyle blueText = TextStyle(
  fontSize: 25.0,
  color: Colors.black,
);

const TextStyle vitaltextLabel = TextStyle(
  fontSize: 17,
  color: Colors.black,
  //fontWeight: FontWeight.bold,
);

const TextStyle vitanumLabel = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);
//End estilos de texto

//start Estilos de botones

Color colorbackbutt1 = Colors.indigo.shade700;
Color colorforebutt1 = Colors.white;
Color colorbackbutt2 = Colors.white;
Color colorforebutt2 = Colors.indigo;
Color colorbackbutt3 = Colors.blueGrey.shade300;
Color colorforebutt3 = Colors.white;
Color confirmBbutt1 = Colors.green.shade400;
Color confirmFbutt1 = Colors.white;
Color cancelBbutt2 = Colors.red.shade300;
Color cancelFbutt2 = Colors.white;
Color colorbackbutt4 = Colors.white;
Color colorforebutt4 = Colors.black;

//end estilos de botones

//Start variables ECG
String buttECG0 = 'NS';
String buttECG1 = 'BS';
String buttECG2 = 'TS';
String buttECG3 = 'FA';
String buttECG4 = 'Flutter';
String buttECG5 = 'TS';
String buttECG6 = 'TSV';
String buttECG7 = 'TVD';
String buttECG8 = 'TVM';
String buttECG9 = 'BS';
String buttECG10 = 'BAVI';
String buttECG11 = 'BAVII';
String buttECG12 = 'BAVIII';
String buttECG13 = 'B';
String buttECG14 = 'B';
String buttECG15 = 'B';
String buttECG16 = 'B';
String buttECG17 = 'B';

String buttConstName = 'Cliked';

bool isClicked = false;

double spaceleft = 7;
double spacetop = 7;
double spaceright = 7;
double spacebott = 7;

//end ECG

//Start variables vital
String heart = "Heart Rate";
String temp = "Temperature";
String spo2 = "SP02";
String sysp = "Systolic Preasure";
String diasp = "Diastolic Preasure";
String freq = "Frecuency";
String co2 = "CO2";

double currentSliderValue1 = 30;
double currentSliderValue2 = 35;
double currentSliderValue3 = 70;
double currentSliderValue4 = 60;
double currentSliderValue5 = 35;
double currentSliderValue6 = 8;
double currentSliderValue7 = 6;

double state1 = 0;

String status1 = '30';
String status2 = '35';
String status3 = '70';
String status4 = '60';
String status5 = '35';
String status6 = '8';
String status7 = '6';

double slidewidht = 270;
double slideheight = 36;
double textwidht = 200;
double textheight = 30;
double buttonwidht = 120;
double buttonheight = 66;

double heartmax = 250;
double heartmin = 30;

double tempmax = 40;
double tempmin = 35;

double spo2max = 100;
double spo2min = 70;

double sysmax = 200;
double sysmin = 60;

double diamax = 120;
double diamin = 35;

double frmax = 32;
double frmin = 8;

double co2max = 50;
double co2min = 6;

String buttVital1 = 'Time';
String buttVital2 = 'Time';
String buttVital3 = 'Time';
String buttVital4 = 'Time';
String buttVital5 = 'Time';
String buttVital6 = 'Time';
String buttVital7 = 'Time';

//END Variables Vital

//Start variables Scenary

String buttSN1 = 'C1';
String buttSN2 = 'C2';
String buttSN3 = 'C3';
String buttSN4 = 'C4';
String buttSN5 = 'P1';
String buttSN6 = 'P2';
String buttSN7 = 'P3';
String buttSN8 = 'P4';

double spaceleftV = 5;
double spacetopV = 10;
double spacerightV = 5;
double spacebottV = 2;

//End scenary

//Start variables History

String textName1 = 'Now';
String textName2 = 'Action 1';
String textName3 = 'Action 2';
String textName4 = 'Action 3';
String textName5 = 'Action 4';
String textName6 = 'Action 5';
String textName7 = 'Action 6';
String textName8 = 'Action 7';
String textName9 = 'Action 8';

String time1 = '00:00';
String time2 = '00:20';
String time3 = '00:45';
String time4 = '00:58';
String time5 = '01:02';
String time6 = '03:00';
String time7 = '03:55';
String time8 = '04:00';
String time9 = '05:55';

//End variables history
