class UsersModel {
  final String? id;
  final String username;
  final String fullName;
  final String password;
  final int? noKaryawan;
  final String? alamat;

  UsersModel({
    this.id,
    required this.username,
    required this.fullName,
    required this.password,
    this.noKaryawan,
    this.alamat,
  });
}
