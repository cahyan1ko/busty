class UserModel {
  final String token;
  final String errorMessage;

  UserModel({required this.token, this.errorMessage = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      token: json['token'] ?? '',
    );
  }

  // Metode untuk menangani error, mengembalikan UserModel dengan pesan error
  factory UserModel.error(String message) {
    return UserModel(
      token: '', // Token kosong jika terjadi error
      errorMessage: message, // Menyimpan pesan error
    );
  }
}
