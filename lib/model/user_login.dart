class UserLogin {
  final String uuid;
  final String username;
  final String password;
  final String salt;
  final String md5;
  final String sha1;
  final String sha256;

  UserLogin({
    required this.uuid,
    required this.username,
    required this.password,
    required this.salt,
    required this.md5,
    required this.sha1,
    required this.sha256,
  });

  factory UserLogin.fromMap(Map<String, dynamic> json) {
    return UserLogin(
        uuid: json['uuid'],
        username: json['username'],
        password: json['password'],
        salt: json['salt'],
        md5: json['md5'],
        sha1: json['sha1'],
        sha256: json['sha256']);
  }
}
