import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AllProvider extends ChangeNotifier {
  bool menu = false;
  double myScrool = 0.0;
  ScrollController controller = ScrollController();

  void setController() {
    controller.dispose();
    controller = ScrollController();
    controller.addListener(() {
      myScrool = controller.offset;
      notifyListeners();
    });
  }

  void animateTo(double scrollIndex) {
    if (controller.hasClients) {
      controller.animateTo(
        scrollIndex,
        curve: Curves.easeInOutCubic,
        duration: const Duration(milliseconds: 700),
      );
    }
  }

  void animate({required int index, required double height}) {
    switch (index) {
      case 0:
        animateTo(0);
        break;
      case 1:
        animateTo(height - 80);
        break;
      case 2:
        animateTo(height * 2 - 80);
        break;
      case 3:
        animateTo(height * 3 + height * 0.3 + 200 - 80);
        break;
      case 4:
        animateTo(height * 4 + height * 0.6 + 300 - 80);
        break;
    }
  }

  void animateSmall({required int index, required double height}) {
    switch (index) {
      case 0:
        animateTo(0);
        break;
      case 1:
        animateTo(height - 80);
        break;
      case 2:
        animateTo(height * 2.5 - 80);
        break;
      case 3:
        animateTo(height * 3.7 + 200);
        break;
      case 4:
        animateTo(height * 5.0 + 300);
        break;
    }
  }

  bool dynamicHover({required int index, required double height}) {
    switch (index) {
      case 0:
        return myScrool < height - 80;
      case 1:
        return myScrool >= height - 80 && myScrool < height * 2 - 80;
      case 2:
        return myScrool >= height * 2 - 80 &&
            myScrool < height * 3 + height * 0.3 + 200 - 80;
      case 3:
        return myScrool >= height * 3 + height * 0.3 + 200 - 80 &&
            myScrool < height * 4 + height * 0.6 + 200 - 80;
      case 4:
        return myScrool >= height * 4 + height * 0.6 + 200 - 80;
    }
    return false;
  }

  bool dynamicSmallHover({required int index, required double height}) {
    switch (index) {
      case 0:
        return myScrool < height - 80;
      case 1:
        return myScrool >= height - 80 && myScrool < height * 2.5 - 80;
      case 2:
        return myScrool >= height * 2.5 - 80 && myScrool < height * 3.7 + 200;
      case 3:
        return myScrool >= height * 3.7 + 200 && myScrool < height * 5.0 + 300;
      case 4:
        return myScrool >= height * 5.0 + 300;
    }
    return false;
  }

  void disposeController() {
    controller.dispose();
  }

  void getControllerOffset({required double offset}) {
    myScrool = offset;
    notifyListeners();
  }

  void toggleMenu() {
    menu = !menu;
    notifyListeners();
  }

  Future<void> _launch(String urlString) async {
    final uri = Uri.parse(urlString);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } else {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      debugPrint('Could not launch $urlString: $e');
    }
  }

  void fb() {
    _launch("https://www.facebook.com/mohamed.ramadan.589297");
  }

  void projects({required String url}) {
    if (url.isNotEmpty) {
      _launch(url);
    }
  }

  void linkedIn() {
    _launch("https://www.linkedin.com/in/mohamed-ramadan512/");
  }

  void gitHub() {
    _launch("https://github.com/Muhammed-Ramadan512");
  }

  void insat() {
    _launch("https://www.instagram.com/mohamed_ramadan512/?hl=en");
  }

  void instagram() {
    _launch("https://www.instagram.com/mohamed_ramadan512/?hl=en");
  }

  void email() {
    _launch("mailto:mohamedramadan949@gmail.com");
  }

  void phone() {
    _launch("tel:+201013691369");
  }

  void portfolio() {
    _launch("https://mr-portofolio.web.app/#/");
  }

  void downloadCv() {
    _launch(
        "https://raw.githubusercontent.com/Muhammed-Ramadan512/MR_Portfolio/main/web/MR-CV.pdf");
  }
}
