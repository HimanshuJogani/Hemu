import 'dart:convert';

// CharacterModel characterModelFromJson(String str) =>
//     CharacterModel.fromJson(json.decode(str));
// String characterModelToJson(CharacterModel data) => json.encode(data.toJson());
//
// class CharacterModel {
//   CharacterModel({
//     int? charId,
//     String? name,
//     String? birthday,
//     List<String>? occupation,
//     String? img,
//     String? status,
//     String? nickname,
//     List<int>? appearance,
//     String? portrayed,
//     String? category,
//     List<dynamic>? betterCallSaulAppearance,
//   }) {
//     _charId = charId;
//     _name = name;
//     _birthday = birthday;
//     _occupation = occupation;
//     _img = img;
//     _status = status;
//     _nickname = nickname;
//     _appearance = appearance;
//     _portrayed = portrayed;
//     _category = category;
//     _betterCallSaulAppearance = betterCallSaulAppearance;
//   }
//
//   CharacterModel.fromJson(dynamic json) {
//     _charId = json['char_id'];
//     _name = json['name'];
//     _birthday = json['birthday'];
//     _occupation =
//         json['occupation'] != null ? json['occupation'].cast<String>() : [];
//     _img = json['img'];
//     _status = json['status'];
//     _nickname = json['nickname'];
//     _appearance =
//         json['appearance'] != null ? json['appearance'].cast<int>() : [];
//     _portrayed = json['portrayed'];
//     _category = json['category'];
//     if (json['better_call_saul_appearance'] != null) {
//       _betterCallSaulAppearance = [];
//       json['better_call_saul_appearance'].forEach((v) {
//         _betterCallSaulAppearance
//             ?.add(json[_betterCallSaulAppearance].fromJson(v));
//       });
//     }
//   }
//   int? _charId;
//   String? _name;
//   String? _birthday;
//   List<String>? _occupation;
//   String? _img;
//   String? _status;
//   String? _nickname;
//   List<int>? _appearance;
//   String? _portrayed;
//   String? _category;
//   List<dynamic>? _betterCallSaulAppearance;
//
//   int? get charId => _charId;
//   String? get name => _name;
//   String? get birthday => _birthday;
//   List<String>? get occupation => _occupation;
//   String? get img => _img;
//   String? get status => _status;
//   String? get nickname => _nickname;
//   List<int>? get appearance => _appearance;
//   String? get portrayed => _portrayed;
//   String? get category => _category;
//   List<dynamic>? get betterCallSaulAppearance => _betterCallSaulAppearance;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['char_id'] = _charId;
//     map['name'] = _name;
//     map['birthday'] = _birthday;
//     map['occupation'] = _occupation;
//     map['img'] = _img;
//     map['status'] = _status;
//     map['nickname'] = _nickname;
//     map['appearance'] = _appearance;
//     map['portrayed'] = _portrayed;
//     map['category'] = _category;
//     if (_betterCallSaulAppearance != null) {
//       map['better_call_saul_appearance'] =
//           _betterCallSaulAppearance?.map((v) => v.toJson()).toList();
//     }
//     return map;
//   }
// }

class CharacterModel {
  int? charId;
  String? name;
  String? birthday;
  List<String>? occupation;
  String? img;
  String? status;
  String? nickname;
  List<int>? appearance;
  String? portrayed;
  String? category;
  List<dynamic>? betterCallSaulAppearance;
  CharacterModel(
      {this.charId,
      this.name,
      this.birthday,
      this.occupation,
      this.img,
      this.status,
      this.nickname,
      this.appearance,
      this.portrayed,
      this.category,
      this.betterCallSaulAppearance});
  CharacterModel.fromJson(Map<String, dynamic> json) {
    if (json["char_id"] is int) charId = json["char_id"];
    if (json["name"] is String) name = json["name"];
    if (json["birthday"] is String) birthday = json["birthday"];
    if (json["occupation"] is List) {
      occupation = json["occupation"] == null
          ? null
          : List<String>.from(json["occupation"]);
    }
    if (json["img"] is String) img = json["img"];
    if (json["status"] is String) status = json["status"];
    if (json["nickname"] is String) nickname = json["nickname"];
    if (json["appearance"] is List) {
      appearance = json["appearance"] == null
          ? null
          : List<int>.from(json["appearance"]);
    }
    if (json["portrayed"] is String) portrayed = json["portrayed"];
    if (json["category"] is String) category = json["category"];
    if (json["better_call_saul_appearance"] is List) {
      betterCallSaulAppearance = json["better_call_saul_appearance"] ?? [];
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["char_id"] = charId;
    data["name"] = name;
    data["birthday"] = birthday;
    if (occupation != null) data["occupation"] = occupation;
    data["img"] = img;
    data["status"] = status;
    data["nickname"] = nickname;
    if (appearance != null) data["appearance"] = appearance;
    data["portrayed"] = portrayed;
    data["category"] = category;
    if (betterCallSaulAppearance != null) {
      data["better_call_saul_appearance"] = betterCallSaulAppearance;
    }
    return data;
  }
}
