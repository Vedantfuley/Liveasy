import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'language_manager.dart';

class Ship extends StatefulWidget {
  const Ship({super.key});

  @override
  State<Ship> createState() => _ShipState();
}

List<String> options = ["Option 0","Option 1"];

class _ShipState extends State<Ship> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                margin:  EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                padding: EdgeInsets.fromLTRB(0*fem, 150*fem, 0*fem, 0*fem),
                child:
                  Text(LanguageManager.instance.getTranslatedValue('prof'),
                        style:  GoogleFonts.roboto(
                          fontSize:  20*ffem,
                          fontWeight:  FontWeight.w700,
                          height:  1.1725*ffem/fem,
                          letterSpacing:  0.0703846142*fem,
                          color:  Color(0xff000000),
          ),
        ),
      ),
            SizedBox(height: 30,),
            Container(
        // autogroupgycuivR (CcypJyuJPUJnt8BmPrGYcu)
              height: 90*fem,
              alignment: Alignment.center,
              width:  325*fem,
              decoration:  BoxDecoration (
              border:  Border.all(color: Color(0xff000000)),
      ),
              child: RadioListTile(
                splashRadius: double.infinity,
                title: ListTile(
                  leading: Image.asset('assets/group-5iR.png',
                    width:  40*fem,
                    height:  40*fem,),
                  title: Text(LanguageManager.instance.getTranslatedValue('ship'),
                  style: GoogleFonts.roboto(
                    fontSize:  18*ffem,
                    fontWeight:  FontWeight.w400,
                    height:  1.1725*ffem/fem,
                    letterSpacing:  0.0703846142*fem,
                    color:  Color(0xff2f3037),
                  ),),
                  subtitle: Text("\nLorem ipsum dolor sit amet, \nconsectetur adipiscing",
                  style: GoogleFonts.roboto(
                    fontSize:  12*ffem,
                    fontWeight:  FontWeight.w400,
                    height:  1.1725*ffem/fem,
                    letterSpacing:  0.0703846142*fem,
                    color:  Color(0xff6a6c7b),
                  ),),
                ),
                selectedTileColor: Color(0xff2e3b62),
                activeColor: Color(0xff2e3b62),
                value: options[0],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                } ,
              ),
            ),
            SizedBox(height: 20,),
            Container(
              // autogroupgycuivR (CcypJyuJPUJnt8BmPrGYcu)
              margin: EdgeInsets.fromLTRB(19, 0, 19, 0),
              height: 90*fem,
              alignment: Alignment.center,
              width:  370*fem,
              decoration:  BoxDecoration (
                border:  Border.all(color: Color(0xff000000)),
              ),
              child: RadioListTile(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashRadius: double.infinity,
                title:  ListTile(
                  leading: Image.asset('assets/group.png',
                    width:  40*fem,
                    height:  25*fem,),
                  title: Text(LanguageManager.instance.getTranslatedValue('tran'),
                  style: GoogleFonts.roboto(
                    fontSize:  18*ffem,
                    fontWeight:  FontWeight.w400,
                    height:  1.1725*ffem/fem,
                    letterSpacing:  0.0703846142*fem,
                    color:  Color(0xff2f3037),
                  ),),
                  subtitle: Text("\nLorem ipsum dolor sit amet, \nconsectetur adipiscing",
                    style: GoogleFonts.roboto(
                      fontSize:  12*ffem,
                      fontWeight:  FontWeight.w400,
                      height:  1.1725*ffem/fem,
                      letterSpacing:  0.0703846142*fem,
                      color:  Color(0xff6a6c7b),
                    ),),
                ),
                activeColor: Color(0xff2e3b62),
                selectedTileColor: Color(0xff2e3b62),
                value: options[1],
                groupValue: currentOption,
                onChanged: (value) {
                  setState(() {
                    currentOption = value.toString();
                  });
                } ,
              ),
            ),
            SizedBox(height: 50,),
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
                  onPressed: () {},
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
