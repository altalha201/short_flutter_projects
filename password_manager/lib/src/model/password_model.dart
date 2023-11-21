class PasswordModel {
  String? pId;
  String? siteName;
  int? siteIndex;
  String? siteLogin;
  String? sitePass;

  PasswordModel({
    this.pId,
    this.siteName,
    this.siteIndex,
    this.siteLogin,
    this.sitePass,
  });

  PasswordModel.fromJson(Map<String, dynamic> json) {
    pId = json['pass_id'];
    siteName = json['site_name'];
    siteIndex = json['site_index'];
    siteLogin = json['site_login'];
    sitePass = json['site_pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pass_id'] = pId;
    data['site_name'] = siteName;
    data['site_index'] = siteIndex;
    data['site_login'] = siteLogin;
    data['site_pass'] = sitePass;
    return data;
  }
}