class ProfileAnakModel{
  int? code;
  String? message;
  ProfileDataAnakModel? data; 

  ProfileAnakModel({
    required this.code, 
    required this.message, 
    required this.data
  }); 

  factory ProfileAnakModel.fromJson(Map<String, dynamic> data){
  return ProfileAnakModel(
    code: data['code'],
    message: data['message'],
    data: ProfileDataAnakModel.fromJson(data['data']) ); 

}

}

class ProfileDataAnakModel{
  String? id;
  String? user_id;
  String? name;
  int? age;
  String? last_education;

  ProfileDataAnakModel({
    required this.id, 
    required this.user_id, 
    required this.name, 
    required this.age, 
    required this.last_education, 
  });

  factory ProfileDataAnakModel.fromJson(Map<String, dynamic> data) {
    return ProfileDataAnakModel(
      id: data["id"],
      user_id: data["user_id"],
      name: data["name"],
      age: data["age"],
      last_education: data["last_education"],
      );
  }

}