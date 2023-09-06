enum EnvirontmentApp { Dev, Production }

class ConstantsApp {
  static late Map<dynamic, dynamic> _config;

  static void setEnvironment(EnvirontmentApp env) {
    switch (env) {
      case EnvirontmentApp.Production:
        _config = _Config.production;
        break;
      default:
        _config = _Config.development;
    }
  }

  static get baseUrl {
    return _config[_Config.baseUrl];
  }

  static get modeDevelopment {
    return _config[_Config.modeDevelopment];
  }

  static get appName {
    return _config[_Config.appName];
  }

  static get versionApp {
    return _config[_Config.versionApp];
  }

  static get apiKey {
    return _config[_Config.xApiKey];
  }
}

class _Config {
  static const String baseUrl = "";
  static const String appName = "";
  static const bool modeDevelopment = false;
  static const String versionApp = "1.0.0";
  static const String xApiKey = '';
  static Map<dynamic, dynamic> development = {
    baseUrl: 'https://newsapi.org/v2/',
    appName: 'News App Dev',
    modeDevelopment: true,
    versionApp: "1.0.0",
    xApiKey: '',
  };

  static Map<dynamic, dynamic> production = {
    baseUrl: 'https://newsapi.org/v2/',
    appName: 'News App',
    modeDevelopment: false,
    versionApp: "1.0.0",
    xApiKey: '',
  };
}
