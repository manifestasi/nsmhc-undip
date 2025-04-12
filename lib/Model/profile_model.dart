class ProfileModel{
  int? code;
  String? message;
  ProfileDataModel? data; 

  ProfileModel({
    required this.code, 
    required this.message, 
    required this.data
  }); 

  factory ProfileModel.fromJson(Map<String, dynamic> data){
  return ProfileModel(
    code: data['code'],
    message: data['message'],
    data: ProfileDataModel.fromJson(data['data']) ); 

}

}

class ProfileDataModel{
  String? id;
  String? user_id;
  String? email;
  String? name;
  String? foto;
  int? age;
  String? no_hp;
  String? last_education;
  String? last_job;
  String? address;

  ProfileDataModel({
    required this.id, 
    required this.user_id, 
    required this.email, 
    required this.name, 
    required this.foto, 
    required this.age, 
    required this.no_hp,
    required this.last_education, 
    required this.last_job, 
    required this.address
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> data) {
    return ProfileDataModel(
      id: data["id"],
      user_id: data["user_id"],
      email: data["email"],
      name: data["name"],
      foto: data["foto"],
      age: data["age"],
      no_hp: data["no_hp"],
      last_education: data["last_education"],
      last_job: data["last_job"],
      address: data["address"]);
  }

}


// {
//   "code": 200,
//   "message": "Data diri berhasil diambil",
//   "data": {
//     "id": "0195cc3d-8f92-75b5-9506-613106095cf5",
//     "users_id": "0195cc3d-8ef9-7337-b1c7-743ccd0270e0",
//     "foto": null,
//     "age": 15,
//     "no_hp": "088884884848",
//     "last_education": "Test123124124",
//     "last_job": "asdfasdfsdafsdf",
//     "address": "adsfasdfsdafasdfsdaf"
//   }
// }