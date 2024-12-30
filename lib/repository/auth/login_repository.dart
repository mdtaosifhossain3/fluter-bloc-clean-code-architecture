import 'package:bloc_clean_code_architecture/config/appUrls/app_urls.dart';
import 'package:bloc_clean_code_architecture/data/network/network_services_api.dart';
import 'package:bloc_clean_code_architecture/models/user_model.dart';

class LoginRepository {
  final _api = NetworkServicesApi();

  Future<UserModel> loginapi(dynamic data) async {
    final response = await _api.postApi(AppUrls.loginapi, data);

    return UserModel.fromJson(response);
  }
}
