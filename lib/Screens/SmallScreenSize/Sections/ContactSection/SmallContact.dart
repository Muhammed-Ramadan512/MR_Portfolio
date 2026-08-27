import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/AllProvider.dart';
import '../../../../constants.dart';
import '../../../FullScreenSize/FullContactSection/FullContact.dart';

class SmallContact extends StatelessWidget {
  const SmallContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);

    return Container(
      width: double.infinity,
      color: const Color(0xff090c14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontFamily: "Zona",
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text: "Get In ",
                        style: TextStyle(color: Colors.amber),
                      ),
                      TextSpan(
                        text: "Touch",
                        style: TextStyle(color: kprimaryColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Feel free to reach out anytime!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 35),
                Center(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      ContactElemet(
                        onTap: () => allProvider.linkedIn(),
                        title: 'LinkedIn',
                        subtitle: '/in/mohamed-ramadan512',
                        icon: FontAwesomeIcons.linkedinIn,
                      ),
                      ContactElemet(
                        onTap: () => allProvider.gitHub(),
                        title: 'GitHub',
                        subtitle: '/Muhammed-Ramadan512',
                        icon: FontAwesomeIcons.github,
                      ),
                      ContactElemet(
                        onTap: () => allProvider.email(),
                        title: 'Email',
                        subtitle: 'mohamedRamadan949@gmail.com',
                        icon: FontAwesomeIcons.envelope,
                      ),
                      ContactElemet(
                        onTap: () => allProvider.phone(),
                        title: 'Phone',
                        subtitle: '+20 01013691369',
                        icon: FontAwesomeIcons.phone,
                      ),
                      ContactElemet(
                        onTap: () => allProvider.fb(),
                        title: 'Facebook',
                        subtitle: '/mohmed.ramadan.75',
                        icon: FontAwesomeIcons.facebookF,
                      ),
                      ContactElemet(
                        onTap: () => allProvider.portfolio(),
                        title: 'Live Portfolio',
                        subtitle: 'mr-portofolio.web.app',
                        icon: FontAwesomeIcons.globe,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: const Color(0xff06080e),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.06),
                ),
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Built with Flutter & ',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 14,
                  ),
                  Text(
                    ' by ',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Text(
                    'Mohamed Ramadan',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Zona",
                      letterSpacing: 1,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
