/**
 * Model untuk Register
 */

class RegisterModel {
  String? email;
  String? password;
  String? password_confirmation;
  String? nama_lengkap_pengguna;
  int? usia_pengguna;
  String? pendidikan_terakhir_pengguna;
  String? pekerjaan_terakhir_pengguna;
  String? alamat;
  String? no_hp;
  String? nama_lengkap_anak;
  int? usia_anak;
  String? pendidikan_terakhir_anak;

  RegisterModel(
      {
      required this.email,
      required this.password,
      required this.password_confirmation,
      required this.nama_lengkap_pengguna,
      required this.usia_pengguna,
      required this.pendidikan_terakhir_pengguna,
      required this.pekerjaan_terakhir_pengguna,
      required this.alamat,
      required this.no_hp,
      required this.nama_lengkap_anak,
      required this.usia_anak,
      required this.pendidikan_terakhir_anak});

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        email: json["email"],
        password: json["password"],
        password_confirmation: json["password_confirmation"],
        nama_lengkap_pengguna: json["nama_lengkap_pengguna"],
        usia_pengguna: json["usia_pengguna"],
        pendidikan_terakhir_pengguna: json["pendidikan_terakhir_pengguna"],
        pekerjaan_terakhir_pengguna: json["pekerjaan_terakhir_pengguna"],
        alamat: json["alamat"],
        no_hp: json["no_hp"],
        nama_lengkap_anak: json["nama_lengkap_anak"],
        usia_anak: json["usia_anak"],
        pendidikan_terakhir_anak: json["pendidikan_terakhir_anak"]);
  }
}



// {
//     "email": "test@gmail.com",
//     "password": "1234567890",
//     "password_confirmation": "1234567890",
//     "nama_lengkap_pengguna": "test",
//     "usia_pengguna": 18,
//     "pendidikan_terakhir_pengguna": "SD negeri 6",
//     "pekerjaan_terakhir_pengguna": "sales",
//     "alamat": "jalan raya no 30 bogor",
//     "no_hp": "088888888",
//     "nama_lengkap_anak": "testAanak",
//     "usia_anak": 4,
//     "pendidikan_terakhir_anak": "TK"
// }