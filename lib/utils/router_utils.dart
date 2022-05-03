enum APP_PAGE { splash, login, home, error, onBoarding }

extension AppPageExtension on APP_PAGE {
  String get toPath {
    switch (this) {
      case APP_PAGE.home:
        return "/";
      case APP_PAGE.login:
        return "/login";
      case APP_PAGE.splash:
        return "/splash";
      case APP_PAGE.error:
        return "/error";
      case APP_PAGE.onBoarding:
        return "/start";
      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case APP_PAGE.home:
        return "HOME";
      case APP_PAGE.login:
        return "LOGIN";
      case APP_PAGE.splash:
        return "SPLASH";
      case APP_PAGE.error:
        return "ERROR";
      case APP_PAGE.onBoarding:
        return "START";
      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case APP_PAGE.home:
        return "WhatsApp";
      case APP_PAGE.login:
        return "WhatsApp Log In";
      case APP_PAGE.splash:
        return "WhatsApp Splash";
      case APP_PAGE.error:
        return "WhatsApp Error";
      case APP_PAGE.onBoarding:
        return "Welcome to WhatsApp";
      default:
        return "WhatsApp";
    }
  }
}
