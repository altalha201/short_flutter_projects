import '../view/helper/view_constants.dart';

class SiteModel {
  final String siteName;
  final int siteIndex;
  final String? siteLink;

  String get value => siteName.replaceAll(" ", "_").toLowerCase();

  String get siteLogoPath => ViewConstants.getSiteLogoAt(siteIndex);

  SiteModel({
    required this.siteName,
    required this.siteIndex,
    this.siteLink,
  });
}
