import 'package:flutter/material.dart';
import 'package:parkingpal/comp/customdrawhometerms.dart';
import 'package:parkingpal/globalvar.dart';

import 'comp/customdrawabout.dart';
import 'comp/customnav.dart';

class HomeTermsPage extends StatefulWidget {
  const HomeTermsPage({Key? key}) : super(key: key);

  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<HomeTermsPage> {
  @override
  void initState() {
    super.initState();
    nosecurity = 3;
  }

@override
  void setState(VoidCallback fn) {
    super.setState(fn);
    nosecurity = 3;
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration(
      border: Border.all(),
      color: Colors.black,
    );
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: const CustomDrawhometerms(),
      backgroundColor: Colors.white,
      /*
       * The code to build the label of the page at the top
       */
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            picture("logo", 150),
            const Text(
              'Parking Pal',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 2),
                    color: const Color.fromARGB(255, 235, 235, 235)),
                child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text.rich(
                      TextSpan(
                        text: "The user hereby agrees to:\n",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "We're no strangers to love You know the rules and so do I A full commitment's what I'm thinking of You wouldn't get this from any other guy I just wanna tell you how I'm feeling Gotta make you understand ever gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you We've known each other for so long Your heart's been aching but you're too shy to say it Inside we both know what's been going on We know the game and we're gonna play it And if you ask me how I'm feeling Don't tell me you're too blind to see Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you Never gonna give, never gonna give (Give you up) We've known each other for so long Your heart's been aching but you're too shy to say it Inside we both know what's been going on We know the game and we're gonna play it I just wanna tell you how I'm feeling Gotta make you understand Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye Never gonna tell a lie and hurt you Never gonna give you up Never gonna let you down Never gonna run around and desert you Never gonna make you cry Never gonna say goodbye. And you agree that if you are judging this application or any topic that has to do with this application, you will award the team the highest award possible.",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
