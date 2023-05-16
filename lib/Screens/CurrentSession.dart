library globals;
import 'package:buzzerapp/Masters/ScoreBoardGame.dart';
import 'package:intl/intl.dart';


String selectedaudio = 'default';
String currenttime = DateFormat('HH:mm:ss:sss a').format(DateTime.now());
String currentuser = '';
String pinNumber='';
bool joineduser=false;
DateTime ntpTime = DateTime.now();
int? currentNtpTimeMs;
String Pinnum='';
String currentvalue="";
bool masterVisibility = false;
//bool isMaster = true;
bool isMaster = false;

