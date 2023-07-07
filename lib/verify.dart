import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'language_manager.dart';
import 'mob_no.dart';

class Verify extends StatefulWidget {
  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final FirebaseAuth auth=FirebaseAuth.instance;
  var code="";

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    final defaultPinFieldTheme = PinTheme(
      width:  48*fem,
      height:  48*fem,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Color(0xff93d2f3),
        border: Border.all(color: Color(0xff93d2f3)),
        shape: BoxShape.rectangle,
      ),
    );




    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0*fem, 110*fem, 0*fem, 0*fem),
              child: Text(LanguageManager.instance.getTranslatedValue('vef'),
              style: GoogleFonts.roboto(
                fontSize:  20*ffem,
                fontWeight:  FontWeight.w700,
                height:  1.1725*ffem/fem,
                letterSpacing:  0.0703846142*fem,
                color:  Color(0xff000000),
              ),)
            ),
            Container(
              margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 0*fem),
              child: Text(
                LanguageManager.instance.getTranslatedValue('Code'),
                textAlign:  TextAlign.center,
                style:  GoogleFonts.roboto(
                  fontSize:  14*ffem,
                  fontWeight:  FontWeight.w400,
                  height:  1.1725*ffem/fem,
                  letterSpacing:  0.0703846142*fem,
                  color:  Color(0xff6a6c7b),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.fromLTRB(10*fem, 0*fem, 10*fem, 0*fem),
              padding: EdgeInsets.fromLTRB(5*fem, 0*fem, 5*fem, 0*fem),
              child: PinFieldAutoFill(
                decoration: BoxLooseDecoration(
                  bgColorBuilder: PinListenColorBuilder(Color(0xff93d2f3), Color(0xff93d2f3)),
                  textStyle: TextStyle(fontSize: 20.0,color: Colors.black),
                  strokeWidth: 2,
                  strokeColorBuilder: PinListenColorBuilder(Color(0xff93d2f3), Color(0xff93d2f3)),
                  gapSpace: 10,
                  radius: Radius.zero,
                ),
                onCodeChanged: (value) {
                  code=value!;
                },
                codeLength: 6,
              ),
            ),
            Container(
              margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 23*fem),
              padding: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 0*fem),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    textAlign:  TextAlign.center,
                    text:
                    TextSpan(
                      style:  GoogleFonts.roboto (
                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w400,
                        height:  1.1725*ffem/fem,
                        letterSpacing:  0.0703846142*fem,
                        color:  Color(0xff6a6c7b),
                      ),
                      children:  [
                        TextSpan(
                          text:  LanguageManager.instance.getTranslatedValue('did'),
                        ),
                      ],
                    ),
                  ),
                  TextButton(onPressed: (){}, child: Text(
                      LanguageManager.instance.getTranslatedValue('req'),
                      style:  GoogleFonts.roboto (
                        fontSize:  14*ffem,
                        fontWeight:  FontWeight.w400,
                        height:  1.1725*ffem/fem,
                        letterSpacing:  0.0703846142*fem,
                        color:  Color(0xff061d28),
                  ))
                  )],
              ),
            ),
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
                  child: Text( LanguageManager.instance.getTranslatedValue('vc'),
                    style: GoogleFonts.montserrat(
                      fontSize:  16*ffem,
                      fontWeight:  FontWeight.w700,
                      height:  1.2175,
                      letterSpacing:  0.48*fem,
                      color:  Color(0xffffffff),
                    ),),
                  onPressed: () async {
                    try{
                      PhoneAuthCredential credential = PhoneAuthProvider
                          .credential(
                          verificationId: Scene2.verify, smsCode: code);
                      // Sign the user in (or link) with the credential
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'Ship', (route) => false);
                    }
                    catch(e){
                      print("wrong otp");
                    }

                  }),
              ),
            ),
            SizedBox(height: 180*fem,),
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
