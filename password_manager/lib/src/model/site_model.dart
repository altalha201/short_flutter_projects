class SiteModel {
  final String siteName;
  final String? siteLink;
  final String? siteLogoURL;

  String get value => siteName.replaceAll(" ", "_").toLowerCase();

  SiteModel({
    required this.siteName,
    this.siteLink,
    this.siteLogoURL,
  });
}
