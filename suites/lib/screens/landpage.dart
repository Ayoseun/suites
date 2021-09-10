import 'package:flutter/material.dart';
import 'package:suites/constants/constants.dart';
import 'package:suites/customs/borderbox.dart';
import 'package:suites/customs/customs.dart';
import 'package:suites/data/DATA.dart';

class LandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //get theme as context
    final ThemeData themeData = Theme.of(context);
    //get size of screen
    final Size size = MediaQuery.of(context).size;
    //custom padding
    final double padding = 16.0;
    //custom sidepadding
    final sidePadding =
        EdgeInsets.symmetric(horizontal: padding, vertical: padding);
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topLeft,
                  colors: [color_greydark, color_white])),
          width: size.width,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: sidePadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: COLOR_GREY,
                    ),
                    Icon(
                      Icons.settings,
                      color: COLOR_GREY,
                    )
                  ],
                ),
              ),
              addverticalSpace(padding),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: COLOR_GREY.withAlpha(70),
                          ),
                        ),
                        Text(
                          "Lekki",
                          style: themeData.textTheme.bodyText2,
                        ),
                        Icon(
                          Icons.arrow_drop_down_rounded,
                          color: COLOR_GREY.withAlpha(70),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Lagos",
                        style: themeData.textTheme.headline1,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "<220,000",
                        "For Sale",
                        "3-4 Bedroom",
                        ">1000 sqft"
                      ].map((filter) => FilterChoice(text: filter)).toList(),
                    )),
              ),
              addverticalSpace(16),
              Expanded(
                child: Padding(
                  padding: sidePadding,
                  child: ListView.builder(
                      itemCount: RE_DATA.length,
                      itemBuilder: (context, index) {
                        return RealEstate(items: RE_DATA[index]);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FilterChoice extends StatelessWidget {
  final String text;

  const FilterChoice({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: color_darkerBlue.withAlpha(20)),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 13),
      margin: const EdgeInsets.only(left: 15, right: 0),
      child: Text(
        text,
        style: themeData.textTheme.bodyText2,
      ),
    );
  }
}

class RealEstate extends StatelessWidget {
  final dynamic items;
  const RealEstate({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ThemeData themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(items["image"])),
              Positioned(
                  top: 15,
                  right: 15,
                  child: Borderbox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_rounded,
                      color: color_darkerBlue,
                    ),
                  ))
            ],
          ),
          addverticalSpace(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  "${items["amount"]}",
                  style: themeData.textTheme.headline3,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "${items["address"]}",
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.bodyText2,
                  ),
                ),
              ),
            ],
          ),
          addverticalSpace(8),
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: Text(
              "${items["description"]}",
              maxLines: 2,
              style: themeData.textTheme.subtitle2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
