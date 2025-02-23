
import '../../../../../core/utils/app_imports.dart';

abstract class LoginAndRegisterationRepo {
  
  Future<UserModel> login(String userName,String password);

 Future<bool> signUp(String userName,String password);
}