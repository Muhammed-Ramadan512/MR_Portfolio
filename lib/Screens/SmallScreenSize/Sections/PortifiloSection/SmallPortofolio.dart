import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Provider/AllProvider.dart';
import '../../../../Provider/Projects.dart';
import '../../../../Widgets/CustomPageIndicator.dart';
import '../../../../constants.dart';
import '../../../FullScreenSize/FullPortifiloSection/components/PortofiloBG.dart';
import '../../../FullScreenSize/FullPortifiloSection/components/PortofiloTitle.dart';
import '../../../FullScreenSize/FullPortifiloSection/components/projectLabel.dart';
import '../../../FullScreenSize/FullPortifiloSection/components/projectSubtitle.dart';
import '../../../FullScreenSize/FullPortifiloSection/components/projectTitle.dart';

class SmallPortoFolio extends StatefulWidget {
  const SmallPortoFolio({Key? key}) : super(key: key);

  @override
  State<SmallPortoFolio> createState() => _SmallPortoFolioState();
}

class _SmallPortoFolioState extends State<SmallPortoFolio> {
  List<int> pindex = [];
  late ScrollController controller;
  bool isinit = true;
  double scroolIndex = 0;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (isinit) {
      final allProjects = Provider.of<AllProjects>(context);
      pindex = List.generate(allProjects.allProjects.length, (index) => 0);
      isinit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final allProjects = Provider.of<AllProjects>(context);
    final allProvider = Provider.of<AllProvider>(context);

    return Container(
      width: double.infinity,
      color: const Color(0xff0b0f19),
      child: Stack(
        children: [
          BgImage(height: height, width: width),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 10),
            child: Column(
              children: [
                const PortofiloTitle(),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Colors.amber,
                      iconSize: 24,
                      onPressed: () {
                        if (controller.hasClients) {
                          final target = (controller.offset - 290).clamp(
                              0.0, controller.position.maxScrollExtent);
                          controller.animateTo(
                            target,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 400),
                          );
                        }
                      },
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        child: Row(
                          children: List.generate(
                            allProjects.allProjects.length,
                            (pIndex) {
                              final project = allProjects.allProjects[pIndex];

                              return Container(
                                width: 280,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xff161f30),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.4),
                                      blurRadius: 14,
                                      offset: const Offset(0, 6),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 180,
                                        width: double.infinity,
                                        child: Stack(
                                          children: [
                                            PageView.builder(
                                              onPageChanged: (i) {
                                                setState(() {
                                                  pindex[pIndex] = i;
                                                });
                                              },
                                              itemCount: project.images.length,
                                              itemBuilder: (context, index) =>
                                                  Container(
                                                color: const Color(0xff0e1524),
                                                child: Image.asset(
                                                  project.images[index],
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 8,
                                              left: 0,
                                              right: 0,
                                              child: CustomPageIndicator(
                                                length: project.images.length,
                                                currentIndex:
                                                    pindex.length > pIndex
                                                        ? pindex[pIndex]
                                                        : 0,
                                                activeWidth: 18,
                                                inactiveWidth: 8,
                                                height: 8,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ProjectTitle(
                                                projectTitle: project.tilte),
                                            const SizedBox(height: 6),
                                            ProjectSubtitle(
                                                projectSubTitle:
                                                    project.subTitle),
                                            const SizedBox(height: 12),
                                            SingleChildScrollView(
                                              scrollDirection:
                                                  Axis.horizontal,
                                              child: Row(
                                                children: List.generate(
                                                  project.labels.length,
                                                  (labelIndex) => ProjectLables(
                                                    labelName: project
                                                        .labels[labelIndex],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 14),
                                            Wrap(
                                              spacing: 6,
                                              runSpacing: 6,
                                              children: [
                                                if (project.playStoreLink != null)
                                                  _buildStoreBtn(
                                                    label: "Google Play ↗",
                                                    url: project.playStoreLink!,
                                                    color: const Color(0xff10b981),
                                                    onTap: () => allProvider.projects(url: project.playStoreLink!),
                                                  ),
                                                if (project.appStoreLink != null)
                                                  _buildStoreBtn(
                                                    label: "App Store ↗",
                                                    url: project.appStoreLink!,
                                                    color: kprimaryColor,
                                                    onTap: () => allProvider.projects(url: project.appStoreLink!),
                                                  ),
                                                if (project.playStoreLink == null && project.appStoreLink == null && project.link.isNotEmpty)
                                                  _buildStoreBtn(
                                                    label: "View Project ↗",
                                                    url: project.link,
                                                    color: Colors.amber,
                                                    onTap: () => allProvider.projects(url: project.link),
                                                  ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      color: Colors.amber,
                      iconSize: 24,
                      onPressed: () {
                        if (controller.hasClients) {
                          final target = (controller.offset + 290).clamp(
                              0.0, controller.position.maxScrollExtent);
                          controller.animateTo(
                            target,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 400),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreBtn({
    required String label,
    required String url,
    required Color color,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color, width: 1.1),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 11,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}
