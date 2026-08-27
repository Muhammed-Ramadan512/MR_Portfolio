import 'package:flutter/material.dart';
import '../../../Widgets/ServiceCard.dart';
import '../../../Widgets/SkillCard.dart';
import '../../../constants.dart';

class FullServices extends StatefulWidget {
  const FullServices({Key? key}) : super(key: key);

  @override
  State<FullServices> createState() => _FullServicesState();
}

class _FullServicesState extends State<FullServices> {
  int? isHover;
  int? isSkillHover_1;
  int? isSkillHover_2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff0e1524),
      child: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.15,
              child: Image.asset(
                'assets/images/recent_work_bg.png',
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1300),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Services Header
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: "Zona",
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 35),

                    // Centered Services Cards (Wrap / Row)
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          services.length,
                          (index) => MouseRegion(
                            onEnter: (_) => setState(() => isHover = index),
                            onExit: (_) => setState(() => isHover = null),
                            child: ServiceCard(
                              maxRadius: 40,
                              width: 250,
                              height: 250,
                              isHover: isHover ?? -1,
                              index: index,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 60),

                    // Skills Header
                    const Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontFamily: "Zona",
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
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
                    const SizedBox(height: 35),

                    // Centered Skills Wrap Row 1
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: List.generate(
                          skills_1.length,
                          (index) => MouseRegion(
                            onEnter: (_) =>
                                setState(() => isSkillHover_1 = index),
                            onExit: (_) =>
                                setState(() => isSkillHover_1 = null),
                            child: SkillsCard(
                              skills: skills_1,
                              maxRadius: 46,
                              paddingRight: 0,
                              paddingleft: 0,
                              index: index,
                              isSkillHover: isSkillHover_1 ?? -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Centered Skills Wrap Row 2
                    Center(
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 14,
                        runSpacing: 14,
                        children: List.generate(
                          skills_2.length,
                          (index) => MouseRegion(
                            onEnter: (_) =>
                                setState(() => isSkillHover_2 = index),
                            onExit: (_) =>
                                setState(() => isSkillHover_2 = null),
                            child: SkillsCard(
                              skills: skills_2,
                              maxRadius: 46,
                              paddingleft: 0,
                              paddingRight: 0,
                              index: index,
                              isSkillHover: isSkillHover_2 ?? -1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
