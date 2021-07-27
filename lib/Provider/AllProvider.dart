import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AllProvider extends ChangeNotifier {
  bool menu = false;

  double myScrool = 0.0;
  ScrollController controller;
  // Color appBarMenuItemColor = Colors.white;

  void setController() {
    controller = ScrollController();
    controller.addListener(() {
      myScrool = controller.offset;
      notifyListeners();
    });
  }

  void animateTo(var scrollIndex) {
    controller.animateTo(scrollIndex,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 700));
  }

  void animate({int index, var height}) {
    switch (index) {
      case 0:
        animateTo(0);
        break;
      case 1:
        animateTo(1 * height - 95);
        break;
      case 2:
        animateTo(2 * height - 95);
        break;
      case 3:
        animateTo(3 * height + height * .3 + 300 - 95);
        break;
      case 4:
        animateTo(4 * height + height * .6 + 300 - 95);
        break;
    }
  }

  void animateSmall({int index, var height}) {
    switch (index) {
      case 0:
        animateTo(0);
        break;
      case 1:
        animateTo(1 * height - 95);
        break;
      case 2:
        animateTo(height - 95 + height * 1.5);
        break;
      case 3:
        animateTo(height * 1.5 + height - 95 + height * 1.2 + 300);
        break;
      case 4:
        animateTo(height * 1.5 + height + height * 1.2 + height * 1.3 + 300);
        break;
    }
  }

  bool dynamicHover({
    int index,
    var height,
  }) {
    switch (index) {
      case 0:
        if (myScrool < height - 95) {
          return true;
        } else {
          return false;
        }

        break;
      case 1:
        if (myScrool >= height - 95 && myScrool < height + height - 95) {
          return true;
        } else {
          return false;
        }
        break;
      case 2:
        if (myScrool >= height + height - 95 &&
            myScrool < height + height - 95 + height * 1.3 + 300) {
          return true;
        } else {
          return false;
        }

        break;
      case 3:
        if (myScrool >= height + height - 95 + height * 1.3 + 300 &&
            myScrool <
                height + height - 95 + height * 1.3 + 300 + height * 1.3) {
          return true;
        } else {
          return false;
        }

        break;
      case 4:
        if (myScrool >=
                height - 95 + height + height * 1.3 + height * 1.3 + 300 &&
            myScrool <
                height -
                    95 +
                    height +
                    height * 1.3 +
                    height * 1.3 +
                    300 +
                    height) {
          return true;
        } else {
          return false;
        }

        break;
    }
    return false;
  }

  bool dynamicSmallHover({
    int index,
    var height,
  }) {
    switch (index) {
      case 0:
        if (myScrool < height - 95) {
          return true;
        } else {
          return false;
        }

        break;
      case 1:
        if (myScrool >= height - 95 && myScrool < height * 1.5 + height - 95) {
          return true;
        } else {
          return false;
        }
        break;
      case 2:
        if (myScrool >= height * 1.5 + height - 95 &&
            myScrool < height * 1.5 + height - 90 + height * 1.2) {
          return true;
        } else {
          return false;
        }

        break;
      case 3:
        if (myScrool >= height * 1.5 + height - 95 + height * 1.2 &&
            myScrool <
                height * 1.5 +
                    height -
                    95 +
                    height * 1.2 +
                    300 +
                    height * 1.3) {
          return true;
        } else {
          return false;
        }

        break;
      case 4:
        if (myScrool >=
            height * 1.5 + height - 95 + height * 1.2 + 300 + height * 1.3) {
          return true;
        } else {
          return false;
        }

        break;
    }
    return false;
  }

  void disposeController() {
    controller.dispose();
  }

  void getControllerOffset({double offset}) {
    if (offset != null) {
      myScrool = offset;
    }

    notifyListeners();
  }

  void toggleMenu() {
    menu = !menu;
    notifyListeners();
  }

  void fb() async {
    String url = "https://www.facebook.com/mohmed.ramadan.75";

    try {
      bool launched =
          await launch(url, enableJavaScript: true, forceSafariVC: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      print(e);
    }
  }

  void projects({String url}) async {
    if (url == null) {
      return;
    } else {}
    //String url = "https://play.google.com/store/apps/details?id=com.Mr.MyPet";

    try {
      bool launched =
          await launch(url, enableJavaScript: true, forceSafariVC: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      print(e);
    }
  }

  void linkedIn() async {
    String url = "https://www.linkedin.com/in/mohamed-ramadan512/";

    try {
      bool launched =
          await launch(url, enableJavaScript: true, forceSafariVC: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      print(e);
    }
  }

  void gitHub() async {
    String url = "https://github.com/Muhammed-Ramadan512";

    try {
      bool launched =
          await launch(url, enableJavaScript: true, forceSafariVC: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      print(e);
    }
  }

  void insat() async {
    String url = "https://www.instagram.com/mohamed_ramadan512/?hl=en";

    try {
      bool launched =
          await launch(url, enableJavaScript: true, forceSafariVC: false);
      if (!launched) {
        await launch(url, forceSafariVC: false);
      }
    } catch (e) {
      print(e);
    }
  }

  void downloadCv() async {
    String fbProtocolUrl;

    fbProtocolUrl =
        "https://drive.google.com/uc?id=1a6oT4U_Xvt0RmaOtbtFW7xqg6k9rCi3r&export=download"; //'fb://page/100033591952970';

    String fallbackUrl =
        'https://drive.google.com/uc?id=1a6oT4U_Xvt0RmaOtbtFW7xqg6k9rCi3r&export=download';

    try {
      bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

      if (!launched) {
        await launch(fallbackUrl, forceSafariVC: false);
      }
    } catch (e) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  }
}
