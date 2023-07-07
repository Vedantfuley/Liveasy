import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/language.dart';
import 'package:projects/language_dropdown.dart';
import 'package:projects/language_manager.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Language? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = languages.first;
    LanguageManager.instance.setLocale(Locale(_selectedLanguage!.code));
    _loadTranslations();
  }

  Future<void> _loadTranslations() async {
    await LanguageManager.instance.loadTranslations();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0*fem, 150*fem, 0*fem, 0*fem),
                child: const Image(image: AssetImage("assets/image.png"),
                width: 42,
                height: 42),
              ),
              SizedBox(height: 50,),
              Container(
                child: Text(
                  LanguageManager.instance.getTranslatedValue('Select'),
                  style: GoogleFonts.roboto(
                    fontSize:  20*ffem,
                    fontWeight:  FontWeight.w700,
                    height:  1.1725*ffem/fem,
                    letterSpacing:  0.0703846142*fem,
                    color:  Color(0xff000000),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                // youcanchangethelanguageatanyti (12:88)
                margin:  EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                constraints:  BoxConstraints (
                  maxWidth:  185*fem,
                ),
                child:
                Text(
                  LanguageManager.instance.getTranslatedValue('chng'),
                  textAlign:  TextAlign.center,
                  style:   GoogleFonts.roboto(
                    fontSize:  14*ffem,
                    fontWeight:  FontWeight.w400,
                    height:  1.1725,
                    letterSpacing:  0.0703846142*fem,
                    color:  Color(0xff6a6c7b),
                  ),
                ),
              ),
              SizedBox(height: 25),
              LanguageDropdown(
                selectedLanguage: _selectedLanguage!,
                onChanged: (Language newValue) async {
                  setState(() {
                    _selectedLanguage = newValue;
                  });
                  await LanguageManager.instance
                      .setLocale(Locale(newValue.code));
                  await _loadTranslations();
                },
              ),
              SizedBox(height: 20,),
              Container(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(height: 50,width: 235),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      backgroundColor: Color(0xff2e3b62),
                    ),
                    child: Text( LanguageManager.instance.getTranslatedValue('next'),
                  style: GoogleFonts.montserrat(
                    fontSize:  16*ffem,
                    fontWeight:  FontWeight.w700,
                    height:  1.2175,
                    letterSpacing:  0.48*fem,
                    color:  Color(0xffffffff),
                  ),),
                    onPressed: () {
                      Navigator.pushNamed(context, 'Scene2');
                    },
                  ),
                ),
              ),
              SizedBox(height: 175*fem,),
              Container(
                // autogroupr7wdAHB (NRYTfnGJx2R5jxJREWR7WD)
                padding:  EdgeInsets.fromLTRB(0*fem, 6*fem, 0*fem, 0*fem),
                width:  420*fem,
                decoration:  BoxDecoration (
                  image:  DecorationImage (
                    fit:  BoxFit.cover,
                    image:  AssetImage ("assets/vector-Auw.png"),
                  ),
                ),
                    child:
                    Image.asset(
                      "assets/vector-mbF.png",
                    ),


              ),
            ],
          ),
        ),
      ),
    );
  }
}
