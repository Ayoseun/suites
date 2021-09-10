import 'package:flutter/material.dart';
import 'package:suites/constants/constants.dart';
import 'package:suites/onboarding/Onboardpage.dart';

final List<ExplanationData> data = [
  ExplanationData(
    description:
        "Get the Home of your dreams at the time that you need, running a payment plan that suites your financially capabilities.",
    title: "Buy A Home",
    localImageSrc: "assets/images/splash_1.png",
  ),
  ExplanationData(
    description:
        "With T.I.A.S using Blockchain technology, smart contracts are used to manage the supplychain 100% securely from the first deposit to your keys",
    title: "Secured Escrow Payment with Smart-Contracts.",
    localImageSrc: "assets/images/splash_2.png",
  ),
  ExplanationData(
    description:
        "Powerful behind the scene AI finacial recommender system that aids in making the right acquisition process decisions.",
    title: "AI Powered Financial Assistant",
    localImageSrc: "assets/images/splash_3.png",
  ),
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> /*with ChangeNotifier*/ {
  final _controller = PageController();

  int _currentIndex = 0;

  // OpenPainter _painter = OpenPainter(3, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: color_white,
        child: SafeArea(
            child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.center,
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: PageView(
                              scrollDirection: Axis.horizontal,
                              controller: _controller,
                              onPageChanged: (value) {
                                // _painter.changeIndex(value);
                                setState(() {
                                  _currentIndex = value;
                                });
                                // notifyListeners();
                              },
                              children: data
                                  .map((e) => ExplanationPage(data: e))
                                  .toList())),
                      flex: 8),
                  Expanded(
                      flex: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(data.length,
                                    (index) => createCircle(index: index)),
                              )),
                        ],
                      ))
                ],
              ),
            )
          ]),
        )));
  }

  createCircle({required int index}) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        margin: EdgeInsets.only(right: 4),
        height: 5,
        width: _currentIndex == index ? 15 : 5,
        decoration: BoxDecoration(
            color: color_darkerBlue2, borderRadius: BorderRadius.circular(3)));
  }
}
