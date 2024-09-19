import 'package:get/get.dart';
import 'package:supabase_storage/utils/supabase_client.dart';

class AuthController extends GetxController {
  Future<String> signup(String password, String email) async {
    var response = '';
    await supabase.auth.signUp(password: password, email: email).then(
      (value) async {
        if (value.user != null) {
          await supabase.from("users").insert({
            "id": value.user!.id,
            "email": email,
            "password": password,
          });
        }
        response = 'success';
      },
    ).catchError(
      (e) {
        response = e.toString();
      },
    );
    return response;
  }

  Future<String> login(String password, String email) async {
    var response = '';
    await supabase.auth
        .signInWithPassword(password: password, email: email)
        .then((value) {
      response = 'success';
    }).catchError((e) {
      response = e.toString();
    });
    return response;
  }
}
