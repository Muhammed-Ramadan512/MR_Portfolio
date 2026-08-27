import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AllProvider.dart';
import '../../../constants.dart';

class FullContact extends StatelessWidget {
  const FullContact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allProvider = Provider.of<AllProvider>(context);

    return Container(
      width: double.infinity,
      color: const Color(0xff090c14),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                const SizedBox(height: 12),
                const Text(
                  "Feel free to reach out for collaborations, questions, or project inquiries.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 50),

                // Contact Elements Grid / Wrap
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1100),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
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
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Footer
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 24),
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
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.redAccent,
                    size: 16,
                  ),
                  Text(
                    ' by ',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  Text(
                    'Mohamed Ramadan',
                    style: TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Zona",
                      letterSpacing: 1,
                      fontSize: 14,
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

class ContactElemet extends StatefulWidget {
  const ContactElemet({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  State<ContactElemet> createState() => _ContactElemetState();
}

class _ContactElemetState extends State<ContactElemet> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          width: 220,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color:
                _isHovered ? const Color(0xff1c273c) : const Color(0xff161f30),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _isHovered
                  ? kprimaryColor
                  : Colors.white.withValues(alpha: 0.08),
              width: _isHovered ? 1.5 : 1,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: kprimaryColor.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isHovered
                      ? Colors.amber
                      : Colors.white.withValues(alpha: 0.06),
                ),
                child: Icon(
                  widget.icon,
                  color: _isHovered ? Colors.black : Colors.white,
                  size: 22,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _isHovered ? Colors.amber : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
