import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:projects/verify.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:ffi';
import 'language_manager.dart';

class Scene2 extends StatefulWidget {


  static String verify = "";


  @override
  State<Scene2> createState() => _Scene2State();

}

class _Scene2State extends State<Scene2> {

  TextEditingController countryController = TextEditingController();
  var phone="";
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.close,color: Colors.black,),
          onPressed: () {
           Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // pleaseenteryourmobilenumberds3 (4:38)
              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              child:
              Text(
                LanguageManager.instance.getTranslatedValue('mob'),
                style:  GoogleFonts.roboto (
                  fontSize:  20*ffem,
                  fontWeight:  FontWeight.w700,
                  height:  1.1725*ffem/fem,
                  letterSpacing:  0.0703846142*fem,
                  color:  Color(0xff000000),
                ),
              ),
            ),
            Container(
              // youllreceivea4digitcodetoverif (4:39)
              margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 31*fem),
              constraints:  BoxConstraints (
                maxWidth:  171*fem,
              ),
              child:
              Text(
                LanguageManager.instance.getTranslatedValue('4dig'),
                textAlign:  TextAlign.center,
                style:  GoogleFonts.roboto (
                  fontSize:  14*ffem,
                  fontWeight:  FontWeight.w400,
                  height:  1.1725*ffem/fem,
                  letterSpacing:  0.0703846142*fem,
                  color:  Color(0xff6a6c7b),
                ),
              ),
            ),
            Container(
              height: 75,
              margin: EdgeInsets.fromLTRB(22, 0, 22, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Image(image: AssetImage('assets/india-2.png'),
                    width: 30,),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 40,
                    child: TextField(
                      controller: countryController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Text(
                    "-",
                    style: TextStyle(fontSize: 33, color: Colors.grey),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                        onChanged: (value) {
                          phone=value;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: LanguageManager.instance.getTranslatedValue('no'),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 50,width: 370),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                    backgroundColor: Color(0xff2e3b62),
                  ),
                  child: Text( LanguageManager.instance.getTranslatedValue('cont'),
                    style: GoogleFonts.montserrat(
                      fontSize:  16*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.2175,
                      letterSpacing:  0.48*fem,
                      color:  Color(0xffffffff),
                    ),),
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Scene2.verify=verificationId;
                        Navigator.pushNamed(context, 'Verify');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 190*fem,),
            Container(
              padding:  EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 0*fem),
              width:  double.infinity,
              decoration:  BoxDecoration (
                image:  DecorationImage (
                  fit:  BoxFit.fill,
                  image:  AssetImage ("assets/vector-Tzy.png"),
                ),
              ),
              child:
              Image.asset(
                "assets/vector-J7s.png",
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
