import 'package:flutter/material.dart';

class ExplanationData {
  final String title;
  final String description;
  final String localImageSrc;

  ExplanationData(
      {required this.title,
      required this.description,
      required this.localImageSrc});
}

class ExplanationPage extends StatelessWidget {
  final ExplanationData data;

  ExplanationPage({required this.data});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Column(children: [
      Expanded(
        flex: 6,
        child: Image.asset(data.localImageSrc,
            height: MediaQuery.of(context).size.height * 0.33,
            alignment: Alignment.center),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          data.title,
          style: themeData.textTheme.headline2,
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Text(
          data.description,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
