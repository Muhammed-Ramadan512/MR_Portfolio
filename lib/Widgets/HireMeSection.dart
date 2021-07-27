import 'package:flutter/material.dart';
import 'package:mr_portofilo/Provider/AllProvider.dart';
import 'package:mr_portofilo/constants.dart';
import 'package:provider/provider.dart';

class HireMeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Image.asset(
          'assets/images/HirrB.jpg',
          height: 300,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          height: 300,
          width: double.infinity,
          color: Colors.black.withOpacity(.6),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Hire me for your project'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5.copyWith(
                          color: Colors.white,
                        )),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'I am available for Freelance Projects. Hire me and get your project Done.'
                      .toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          Colors.white, //kprimaryColor, //Colors.amberAccent,
                      fontWeight: FontWeight.w400,
                      fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  child: OutlineButton(
                    hoverColor: kprimaryColor,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    borderSide: BorderSide(color: Colors.amber),
                    color: Colors.amber,
                    onPressed: () {
                      width < 830
                          ? allProvider.animateSmall(height: height, index: 4)
                          : allProvider.animate(index: 4, height: height);
                    },
                    child: Row(
                      children: [
                        Image.asset('assets/images/hand.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Hire Me',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
