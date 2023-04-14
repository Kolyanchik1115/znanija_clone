import 'package:google_sign_in/google_sign_in.dart';
import 'package:znanija_clone/models/user_model.dart';

class GoogleUserAdapter {
  UserInfoModel adaptData(dynamic data) {
    final GoogleSignInAccount? googleAccount = data;
    if (googleAccount != null) {
      return UserInfoModel(
        email: googleAccount.email,
      );
    }
    throw Exception('Failed to save data to model from Google');
  }
}
