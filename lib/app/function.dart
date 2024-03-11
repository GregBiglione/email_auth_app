// Check email -----------------------------------------------------------------
import 'package:email_validator/email_validator.dart';

bool isEmail(String email) {
  return EmailValidator.validate(email);
}