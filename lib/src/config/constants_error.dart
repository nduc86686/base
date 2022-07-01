class ConstantsError {
  const ConstantsError._();

  // Form Email
  static String emailEmpty = '*Vui lòng điền đầy đủ thông tin';
  static String emailInvalid = '*Email không chính xác ';
  static String emailExists = '*Email đã tồn tại trong hệ thống';
  static String emailExistsForgotPass = '*Email không tồn tại trong hệ thống. '
      'Vui lòng đăng kí tài khoản';

  //  Form ConfirmPassword
  static String confirmPassEmpty = '*Vui lòng điền đầy đủ thông tin để đăng ký';
  static String confirmPassInvalid = '*Mật khẩu không trùng khớp';

  // Form Password
  static String passwordEmpty = '*Vui lòng điền đầy đủ thông tin';
  static String passwordInvalid =
      '*Mật khẩu phải có ít nhất 6 ký tự và không dấu';

  // Form name
  static String nameEmpty = '*Vui lòng điền đầy đủ thông tin để đăng ký';
  static String nameInvalid = '*Họ và tên không nhập quá 30 ký tự';

  // Form OTP
  static String otpError = '*Mã xác nhận không chính xác';
  static String otpInvalid = 'Mã xác nhận bao gồm 6 ký tự';

  // Login screen
  static String loginError = '*Email hoặc mật khẩu không chính xác';

  //null value
  static String nullValue = '';
}
