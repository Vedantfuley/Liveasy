import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/language.dart';


class LanguageDropdown extends StatelessWidget {
  final Language selectedLanguage;
  final ValueChanged<Language> onChanged;

  const LanguageDropdown({
    Key? key,
    required this.selectedLanguage,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      margin:  EdgeInsets.fromLTRB(90, 0, 90, 0),
      padding:  EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration:  BoxDecoration (
          border:  Border.all(color: Color(0xff2f3037))),
      child: DropdownButton<Language>(
        isExpanded: true,
        style:  GoogleFonts.montserrat(
          fontSize:  16*ffem,
          fontWeight:  FontWeight.w400,
          height:  1.2175,
          color:  Color(0xff2f3037),
        ),
        value: selectedLanguage,
        onChanged: (Language? newValue) {
          onChanged(newValue!);  },
        items: languages.map<DropdownMenuItem<Language>>(
          (Language language) {
            return DropdownMenuItem<Language>(
              value: language,
              child: Text(language.name,),
            );
          },
        ).toList(),
      ),
    );
  }
}
