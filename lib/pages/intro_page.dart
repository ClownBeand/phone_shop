import 'package:electronics/Themes/hyper.dart';
import 'package:electronics/components/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0C10),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Shop name
          const SizedBox(
            height: 200,
          ),
          Stack(
            children: <Widget>[
              Center(
                  child: Image.asset(
                "assets/images/3.0x/new-moon.png",
              )),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 170),
                  child: Text(
                    """Encommerce Concept""",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 34,
                      color: primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 150),

          //Get started button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, "/homepage");
              },
            ),
          )
        ],
      ),
    );
  }
}
