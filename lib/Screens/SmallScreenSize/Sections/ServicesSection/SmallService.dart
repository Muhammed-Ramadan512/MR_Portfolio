import 'package:flutter/material.dart';
import '../../../../Widgets/ServiceCard.dart';
import '../../../../Widgets/SkillCard.dart';
import '../../../../constants.dart';

class SmallService extends StatefulWidget {
  const SmallService({Key? key}) : super(key: key);

  @override
  State<SmallService> createState() => _SmallServiceState();
}

class _SmallServiceState extends State<SmallService> {
  int? isHover;
  int? isSkillHover_1;
  int? isSkillHover_2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff0e1524),
      padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Services Title
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: "Zona",
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 1.5,
              ),
              children: [
                TextSpan(
                  text: "Offering ",
                  style: TextStyle(color: Colors.amber),
                ),
                TextSpan(
                  text: "Services",
                  style: TextStyle(color: kprimaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // Horizontal Services List
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                services.length,
                (index) => MouseRegion(
                  onEnter: (_) => setState(() => isHover = index),
                  onExit: (_) => setState(() => isHover = null),
                  child: ServiceCard(
                    maxRadius: 32,
                    width: 190,
                    height: 215,
                    isHover: isHover ?? -1,
                    index: index,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 45),

          // Skills Title
          const Text.rich(
            TextSpan(
              style: TextStyle(
                fontFamily: "Zona",
                fontWeight: FontWeight.bold,
                fontSize: 24,
                letterSpacing: 1.5,
              ),
              children: [
                TextSpan(
                  text: "My ",
                  style: TextStyle(color: Colors.amber),
                ),
                TextSpan(
                  text: "Skills",
                  style: TextStyle(color: kprimaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),

          // Centered Skills Rows
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    skills_1.length,
                    (index) => MouseRegion(
                      onEnter: (_) => setState(() => isSkillHover_1 = index),
                      onExit: (_) => setState(() => isSkillHover_1 = null),
                      child: SkillsCard(
                        skills: skills_1,
                        maxRadius: 40,
                        paddingRight: 8,
                        paddingleft: 8,
                        index: index,
                        isSkillHover: isSkillHover_1 ?? -1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    skills_2.length,
                    (index) => MouseRegion(
                      onEnter: (_) => setState(() => isSkillHover_2 = index),
                      onExit: (_) => setState(() => isSkillHover_2 = null),
                      child: SkillsCard(
                        skills: skills_2,
                        maxRadius: 40,
                        paddingleft: 8,
                        paddingRight: 8,
                        index: index,
                        isSkillHover: isSkillHover_2 ?? -1,
                      ),
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
