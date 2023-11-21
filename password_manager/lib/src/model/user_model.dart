class UserModel {
  String? userId;
  String? userName;
  String? userEmail;
  String? userPass;
  List<String>? userPassList;

  UserModel({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPass,
    this.userPassList,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userPass = json['user_pass'];
    userPassList = json["user_pass_list"].cast<String>();
  }

  void copyWith(UserModel user) {
    userId = user.userId ?? userId;
    userName = user.userName ?? userName;
    userEmail = user.userEmail ?? userEmail;
    userPass = user.userPass ?? userPass;
    userPassList = user.userPassList ?? userPassList;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_pass'] = userPass;
    data['user_pass_list'] = userPassList;
    return data;
  }
}
