import 'package:string_validator/string_validator.dart' as validate;

class FormBuilderValidators {
  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo precisa ser preenchido.';
    } else if (!validate.isEmail(value)) {
      return 'Formato de e-mail inválido.';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo precisa ser preenchido.';
    } else if (value.length < 8) {
      return 'Digite uma senha apartir de 8 caracteres';
    }
  }
}
