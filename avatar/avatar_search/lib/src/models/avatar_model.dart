class AvatarModel {
  String name;
  String photoUrl;

  AvatarModel({this.name, this.photoUrl});

  AvatarModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data[name] = this.name;
    data[photoUrl] = this.photoUrl;
    return data;
  }
}
