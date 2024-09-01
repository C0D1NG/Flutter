class AppConfigResponse {
  late AppConfig data;
  late int statusCode;

  AppConfigResponse({required this.data, required this.statusCode});

  AppConfigResponse.fromJson(Map<String, dynamic> json) {
    data = AppConfig.fromJson(json['data']);
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    data['statusCode'] = statusCode;
    return data;
  }
}

class AppConfig {
  late String config;
  late String buildNumber;

  AppConfig({required this.config});

  AppConfig.fromJson(Map<String, dynamic> json) {
    config = json['config'];
    buildNumber = json['buildNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['config'] = config;
    data['buildNumber'] = buildNumber;
    return data;
  }
}
