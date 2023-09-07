class CharacterModel {
  late final int charId;
  late final String name;
  late final String birthday;
  late final List<String> occupation;
  late final String img;
  late final String status;
  late final String nickname;
  late final List<dynamic> appearance;
  late final String portrayed;
  late final String category;
  late final List<dynamic> betterCallSaulAppearance;

  CharacterModel({
    required this.charId,
    required this.name,
    required this.birthday,
    required this.occupation,
    required this.img,
    required this.status,
    required this.nickname,
    required this.appearance,
    required this.portrayed,
    required this.category,
    required this.betterCallSaulAppearance,
  });

  CharacterModel.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    occupation = List.castFrom<dynamic, String>(json['occupation']);
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    appearance = json['appearance'];
    portrayed = json['portrayed'];
    category = json['category'];
    betterCallSaulAppearance = json['better_call_saul_appearance'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['char_id'] = charId;
    data['name'] = name;
    data['birthday'] = birthday;
    data['occupation'] = occupation;
    data['img'] = img;
    data['status'] = status;
    data['nickname'] = nickname;
    data['appearance'] = appearance;
    data['portrayed'] = portrayed;
    data['category'] = category;
    data['better_call_saul_appearance'] = betterCallSaulAppearance;
    return data;
  }
}
