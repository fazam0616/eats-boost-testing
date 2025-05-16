import 'package:eats_boost_mobile_app/flutter_flow/flutter_flow_model.dart';
import 'package:eats_boost_mobile_app/flutter_flow/flutter_flow_theme.dart';
import 'package:eats_boost_mobile_app/flutter_flow/flutter_flow_util.dart';
import 'package:eats_boost_mobile_app/index.dart';
import 'package:eats_boost_mobile_app/onboarding/introduction/intro_page_model.dart';
import 'package:eats_boost_mobile_app/onboarding/introduction/mission_statement/mission_statement_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class IntroPageWidget extends StatefulWidget {
  const IntroPageWidget({super.key});
  static String routeName = 'Intro_Page';
  static String routePath = '/introPage';

  @override
  State<IntroPageWidget> createState() => _IntroPageWidgetState();
}

class _IntroPageWidgetState extends State<IntroPageWidget> {
  bool get isLastPage => _model.currentPage == _model.pages.length - 1;

  void _onNextPressed() {
    if (!isLastPage) {
      _model.controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      // final navigation
      context.pushNamedAuth(
        GenerateOffersWidget.routeName,
        context.mounted,
      );
    }
  }

  late IntroPageModel _model;
  final ButtonStyle _orangeButton = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 253, 232, 199),
    foregroundColor: Color(0xFFE65C00),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    minimumSize: const Size(200, 1),
  );
  final ButtonStyle _blackButton = ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    minimumSize: const Size(200, 1),
  );
  static const TextStyle _orangeText = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: Color(0xFFE65C00),
      fontFamily: 'Montserrat');
  static const TextStyle _blackText = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Colors.black,
      fontFamily: 'Montserrat');
  static const TextStyle _blueText = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
      color: Color.fromARGB(255, 151, 248, 255),
      fontFamily: 'Montserrat');

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IntroPageModel());
    _model.controller = PageController();
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> depositNote = [
      "Unused deposits carry over to the next cycle",
      "Your first deposit in each cycle sets your plan.\nEven if you deposit more later, your plan stays\nbased on that initial amount.",
      "A new cycle begins on the 1st of every month"
    ];
    _model.pages = [
      // Add your page widgets here
      Column(
        children: [
          Center(
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: const Text(
                      'Welcome to',
                      style: _IntroPageWidgetState._blackText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 0),
                    child: Text(
                      'EatsBoost!',
                      style: _IntroPageWidgetState._orangeText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      'You\'re about to\nwonder how you ever lived without it.',
                      style: _IntroPageWidgetState._blackText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Text(
                    'Let\'s get you\nstarted.',
                    style: _IntroPageWidgetState._blackText,
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: ElevatedButton(
                      style: _blackButton,
                      onPressed: () {
                        context.pushNamedAuth(
                          MissionStatementWidget.routeName,
                          context.mounted,
                        );
                      },
                      child: const Text(
                        'Why Eats Boost?',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'EatsBoost ',
                    style: _orangeText,
                    children: [
                      TextSpan(
                        text: 'Lets You Unlock',
                        style: _blackText,
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.top,
                        child: SizedBox(
                          height: 32,
                          child: GradientText(
                            ' Exclusive\n',
                            style: _blackText,
                            colors: const [
                              Color.fromARGB(255, 151, 248, 255),
                              Color.fromARGB(255, 0, 92, 230),
                            ],
                            gradientDirection: GradientDirection.ltr,
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                            'Perks at Your Favorite\nRestaurants — Enjoy Savings Every Time You Order',
                        style: _blackText,
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Regulars Shouldn’t Pay The Regular Price ',
                  textAlign: TextAlign.center,
                  style: _blackText.copyWith(
                      fontSize: 18, fontStyle: FontStyle.italic)),
            ),
          ],
        )),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, bottom: 8, left: 20, right: 8),
            child: Text(
              textAlign: TextAlign.left,
              'Step 1: Buy a Boost Card',
              style: _blackText.copyWith(fontSize: 20),
            ),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: _blackText.copyWith(fontSize: 16),
                      text:
                          'Access is limited. Each restaurant has a set number of Boost Cards available — yours is just ',
                      children: [
                        TextSpan(
                            text: '\$6 ',
                            style: _orangeText.copyWith(
                                fontStyle: FontStyle.normal, fontSize: 16)),
                        TextSpan(
                            text: 'away',
                            style: _blackText.copyWith(fontSize: 16))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.asset(
                  'assets/images/cards.png',
                  scale: 2,
                ),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20, right: 8),
            child: Text('Step 2: Add Restaurant',
                style: _blackText.copyWith(fontSize: 20)),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 32.0, left: 32, right: 32, bottom: 16),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: _blackText.copyWith(fontSize: 16),
                      text:
                          'Your exclusive Boost Card has a QR Code on the back. Scan the QR Code to add your favourite restaurant to your profile and become an',
                      children: [
                        TextSpan(
                            text: ' official ',
                            style: _orangeText.copyWith(
                                fontStyle: FontStyle.normal, fontSize: 16)),
                        TextSpan(
                            text: 'member',
                            style: _blackText.copyWith(fontSize: 16))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Image.asset('assets/images/image 130.png'),
              ),
            ],
          )),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 56,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 247, 211, 12),
                        Color.fromARGB(255, 255, 6, 234),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, left: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Each Restaurant Only Has 250 Boost\nCards. Buy Yours Fast.',
                        style: _blackText.copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8),
            child: Text(
              textAlign: TextAlign.left,
              'Step 3: Select Your Plan',
              style: _blackText.copyWith(fontSize: 20),
            ),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32, bottom: 32, top: 8),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: _blackText.copyWith(fontSize: 16),
                      text:
                          'To start saving, simply deposit into your EatsBoost Wallet. By default, deposits are made as needed — but switch to ',
                      children: [
                        TextSpan(
                            text: 'auto-refills ',
                            style: _blueText.copyWith(
                                fontStyle: FontStyle.normal, fontSize: 16)),
                        TextSpan(
                            text:
                                ' to unlock even greater savings. Each plan comes with it’s own perks & savings',
                            style: _blackText.copyWith(fontSize: 16))
                      ],
                    )),
              ),
            ],
          )),
          Center(
            child: SizedBox(
              width: 325,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 187, 244, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8),
                      child: Text('A Few Notes About Deposits:',
                          textAlign: TextAlign.start,
                          style: _blackText.copyWith(fontSize: 18)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: depositNote
                            .map((line) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('•  ',
                                          style: _blackText.copyWith(
                                              fontSize: 12)),
                                      // Expanded makes wrapped text indent under itself
                                      Expanded(
                                        child: Text(line.trim(),
                                            style: _blackText.copyWith(
                                                fontSize: 12)),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8, top: 16),
            child: Text(
              textAlign: TextAlign.left,
              'Step 4: Place Orders',
              style: _blackText.copyWith(fontSize: 20),
            ),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32, bottom: 16, top: 8),
                child: Text(
                  'All orders must be placed through the app — whether you\'re dining in or ordering ahead. Your savings are applied automatically at checkout.',
                  style: _blackText.copyWith(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          )),
          Center(
            child: Image.asset(
              'assets/images/image 207.png',
              scale: 1,
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 8, top: 32),
            child: Text(
              textAlign: TextAlign.center,
              'EatsBoost Gets Even Better With Friends.',
              style: _blackText.copyWith(fontSize: 20),
            ),
          ),
          Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32.0, right: 32, bottom: 32, top: 8),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: _orangeText.copyWith(
                          fontSize: 16, fontStyle: FontStyle.normal),
                      text: 'Add Friends! ',
                      children: [
                        TextSpan(
                            text:
                                'The Social Tab let’s you add friends and send them ',
                            style: _blackText.copyWith(
                                fontStyle: FontStyle.normal, fontSize: 16)),
                        TextSpan(
                            text: 'social gifts',
                            style: _orangeText.copyWith(
                                fontSize: 16, fontStyle: FontStyle.normal)),
                        TextSpan(
                            text:
                                ' which can later be used to Boost your savings even more!',
                            style: _blackText.copyWith(
                                fontStyle: FontStyle.normal, fontSize: 16)),
                      ],
                    )),
              ),
            ],
          )),
          Center(
            child: SizedBox(
              width: 350,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 151, 248, 255),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: const RadialGradient(
                      center: Alignment.bottomLeft,
                      radius: 5,
                      // stops: [0.75, 1],
                      colors: [
                        Color.fromARGB(255, 151, 248, 255),
                        Color.fromARGB(99, 164, 6, 255),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text:
                              'Every time you place an order, you earn a random number of',
                          style: _blackText.copyWith(fontSize: 16),
                          children: [
                            TextSpan(
                                text: ' Plates',
                                style: _orangeText.copyWith(
                                    fontSize: 16, fontStyle: FontStyle.normal)),
                            TextSpan(
                                text:
                                    ' — and the number grows with each visit. You keep half, and the other half must be sent to friends.',
                                style: _blackText.copyWith(fontSize: 16)),
                            TextSpan(
                                text: '\nMore Friends = More Savings',
                                style: _orangeText.copyWith(fontSize: 16)),
                          ],
                        )),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 32, top: 32),
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                      text: TextSpan(text: '10', style: _blackText, children: [
                    WidgetSpan(child: SizedBox(width: 8)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset('assets/images/plate.png')),
                    WidgetSpan(child: SizedBox(width: 8)),
                    WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Image.asset('assets/images/equals.png')),
                    WidgetSpan(child: SizedBox(width: 8)),
                    TextSpan(
                      text: '\$0.10',
                      style: _blackText,
                    ),
                  ]))
                ],
              ),
            ),
          ),
          Center(
            child: SizedBox(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 235, 235),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    'You can use plates at checkout',
                    style: _blackText.copyWith(fontSize: 16),
                  ),
                ),
              ),
            ),
          )
        ],
      )
    ];
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  color: Colors.white,
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
                  child: PageView(
                    controller: _model.controller,
                    onPageChanged: (i) => setState(() {
                      _model.changePage(i);
                    }),
                    children: _model.pages,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: ElevatedButton(
                    style: _orangeButton,
                    onPressed: _onNextPressed,
                    child: Text(
                      isLastPage ? 'Done' : 'Next',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE65C00)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
