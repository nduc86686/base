import '../../../core/params/login/login_with_user.dart';
import '../../../core/resources/data_state.dart';
import '../../entities/login/login.dart';

abstract class LoginRepository {
  Future<DataState<Login>> loginWithUserName(LoginParam params);
}
