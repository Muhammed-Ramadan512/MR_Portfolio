import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/AllProvider.dart';
import '../../../Provider/Projects.dart';
import '../../../Widgets/CustomPageIndicator.dart';
import '../../../constants.dart';
import 'components/PortofiloBG.dart';
import 'components/PortofiloTitle.dart';
import 'components/projectLabel.dart';
import 'components/projectSubtitle.dart';
import 'components/projectTitle.dart';

class FullProtofilo extends StatefulWidget {
  const FullProtofilo({Key? key}) : super(key: key);

  @override
  State<FullProtofilo> createState() => _FullProtofiloState();
}

class _FullProtofiloState extends State<FullProtofilo> {
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
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
            child: Column(
              children: [
                const PortofiloTitle(),
                const SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Previous Button
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      color: Colors.amber,
                      iconSize: 32,
                      hoverColor: Colors.white10,
                      onPressed: () {
                        if (controller.hasClients) {
                          final target = (controller.offset - 420).clamp(
                              0.0, controller.position.maxScrollExtent);
                          controller.animateTo(
                            target,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 500),
                          );
                        }
                      },
                    ),
                    const SizedBox(width: 10),

                    // Projects List View
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: width > 1200 ? 1000 : (width - 150),
                        maxHeight: 600,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        child: Row(
                          children: List.generate(
                            allProjects.allProjects.length,
                            (pIndex) {
                              final project = allProjects.allProjects[pIndex];

                              return Container(
                                width: 380,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xff161f30),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: Colors.white.withValues(alpha: 0.08),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: 0.4),
                                      blurRadius: 18,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image Carousel
                                      SizedBox(
                                        height: 250,
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
                                              bottom: 12,
                                              left: 0,
                                              right: 0,
                                              child: CustomPageIndicator(
                                                length: project.images.length,
                                                currentIndex:
                                                    pindex.length > pIndex
                                                        ? pindex[pIndex]
                                                        : 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      // Project Content Info
                                      Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ProjectTitle(
                                                projectTitle: project.tilte),
                                            const SizedBox(height: 10),
                                            ProjectSubtitle(
                                                projectSubTitle:
                                                    project.subTitle),
                                            const SizedBox(height: 18),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
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
                                            const SizedBox(height: 18),
                                            Wrap(
                                              spacing: 8,
                                              runSpacing: 8,
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
                    const SizedBox(width: 10),

                    // Next Button
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                      color: Colors.amber,
                      iconSize: 32,
                      hoverColor: Colors.white10,
                      onPressed: () {
                        if (controller.hasClients) {
                          final target = (controller.offset + 420).clamp(
                              0.0, controller.position.maxScrollExtent);
                          controller.animateTo(
                            target,
                            curve: Curves.easeInOutCubic,
                            duration: const Duration(milliseconds: 500),
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: color, width: 1.2),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
