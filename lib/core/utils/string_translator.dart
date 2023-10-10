class StringTranslator {
  static build(String value){
    if (value == '[firebase_auth/email-already-in-use] The email address is already in use by another account.'){
      return 'O endereço de e-mail já está em uso.';
    } else if (value == '[firebase_auth/INVALID_LOGIN_CREDENTIALS] An internal error has occurred. [ INVALID_LOGIN_CREDENTIALS ]'){
      return 'E-mail ou senha inválido.';
    }
  }
}