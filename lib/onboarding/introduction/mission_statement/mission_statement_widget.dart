import 'package:flutter/material.dart';

class MissionStatementWidget extends StatefulWidget {
  const MissionStatementWidget({super.key});

  static String routeName = 'Mission_Statement';
  static String routePath = '/missionStatement';
  @override
  State<MissionStatementWidget> createState() => _MissionStatementWidgetState();
}

class _MissionStatementWidgetState extends State<MissionStatementWidget> {
  final ButtonStyle _blackButton = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    minimumSize: const Size(200, 1),
  );

  final TextStyle _orangeText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Color(0xFFE65C00),
      fontFamily: 'Montserrat');
  final TextStyle _blackText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      fontFamily: 'Montserrat');

  final TextStyle _greenText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.green,
      fontFamily: 'Montserrat');

  final TextStyle _redText = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.red,
      fontFamily: 'Montserrat');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/EatsBoost_Logo_(Consumer).png',
                    width: 50, height: 50),
                Text(
                  'EatsBoost',
                  style: _blackText.copyWith(fontSize: 16),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: RichText(
                        text: TextSpan(
                            text: 'Because ',
                            style: _blackText,
                            children: [
                          TextSpan(
                            text: 'Local Restaurants',
                            style: _orangeText,
                          ),
                          TextSpan(
                            text: ' Are The Real Heroes',
                            style: _blackText,
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: RichText(
                        text: TextSpan(
                            text: 'They serve ',
                            style: _blackText,
                            children: [
                          TextSpan(
                            text: 'smiles\n',
                            style: _greenText,
                          ),
                          TextSpan(
                            text: 'They build ',
                            children: [
                              TextSpan(
                                text: 'community\n',
                                style: _greenText,
                              ),
                            ],
                            style: _blackText,
                          ),
                          TextSpan(
                            text: 'They don\'t chase ',
                            children: [
                              TextSpan(
                                text: 'corporate\nprofits',
                                style: _redText,
                              ),
                            ],
                            style: _blackText,
                          ),
                        ])),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: RichText(
                      text: TextSpan(
                        text: 'Big chains ',
                        style: _blackText,
                        children: [
                          TextSpan(
                            text: 'can ',
                            style: _redText,
                          ),
                          TextSpan(
                            text: ' afford expensive\napps\nLocal restaurants ',
                            style: _blackText,
                          ),
                          TextSpan(
                            text: 'can\'t\n',
                            style: _redText,
                          ),
                          TextSpan(
                            text: 'When they turn to apps like\nUber, they ',
                            style: _blackText,
                          ),
                          TextSpan(
                            text: 'lose ',
                            style: _redText,
                          ),
                          TextSpan(children: [
                            TextSpan(
                              text: '30% of every order\n',
                              style: _blackText,
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: RichText(
                      text: TextSpan(
                        text:
                            'EatsBoost was built for the local heroes — and to reward the regulars who keep them going',
                        style: _blackText,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Support ',
                          style: _blackText,
                          children: [
                            TextSpan(
                              text: 'Local\n\n',
                              style: _greenText,
                            ),
                            TextSpan(
                              text: 'Grow Your ',
                              style: _blackText,
                            ),
                            TextSpan(
                              text: 'Community\n\n',
                              style: _greenText,
                            ),
                            TextSpan(
                              text: 'Join ',
                              style: _blackText,
                            ),
                            TextSpan(
                              text: 'EatsBoost',
                              style: _orangeText.copyWith(
                                  fontStyle: FontStyle.italic),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Back'),
                      style: _blackButton,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
