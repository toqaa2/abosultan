
import 'package:abosultan/core/network/api_service.dart';

import '../../../../../core/utils/app_imports.dart';

class LoginAndRegisterationRepoImpl implements LoginAndRegisterationRepo{
  @override
  Future<UserModel> login(String userName, String password) async{
   try{
     var response = await ApiService.postData(endPoint: 'login',data: {
       'user_name':userName,
       'password':password,
     });

     if(response.statusCode==200||response.statusCode==201){
       return UserModel.fromJson(response.data);
     }else{
       return UserModel.fromJson(response.data['errMsg']);
     }

   }catch(e){
     return UserModel.fromJson({});

   }
  }

  @override
  Future<bool> signUp(String userName, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
  
}