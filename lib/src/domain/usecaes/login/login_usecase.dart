import 'package:duck/src/core/params/login/login_with_user.dart';
import 'package:injectable/injectable.dart';

import '../../../core/resources/data_state.dart';
import '../../../core/usecase/usecase.dart';
import '../../entities/login/login.dart';
import '../../repositories/login/login_responsitory.dart';

@injectable
class LoginUseCase implements UseCase<DataState<Login>, LoginParam> {
  final LoginRepository _loginRepository;

  LoginUseCase(this._loginRepository);

  @override
  Future<DataState<Login>> call({LoginParam? params}) {
    // TODO: implement call
    return _loginRepository.loginWithUserName(params!);
  }
}
