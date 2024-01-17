class MyFirebaseAuthException{
  final String code;
  MyFirebaseAuthException(this.code);
  
  String get message{
    switch (code) {
      case 'email-already-in-use':
      return 'Account is registered with this email address.';
      case 'invalid-email':
      return 'The email address is invalid';
      case 'weak-password':
      return 'The password isn\'t strong';
      case 'user-not-found':
      return 'The user is not found with given email address';
      case 'user-disabled':
      return 'The user\'t account has been disabled';
      case 'wrong-password':
      return 'Incorrect password! Please check your password again';
      case 'account-exists-with-different-credential':
      return 'Account is already existed with different credentials';
      case 'invalid-verification-code':
      return 'Invalid verification code. Please enter valid code';
      case 'invalid-verification-id':
      return 'Invalid verification Id. Please enter valid Id';
      case 'expired-action-code':
      return 'The code is expired';
      case 'invalid-action-code':
      return 'The code is invalid';
      case 'too-many-requests':
      return 'Too many attempts. Please try again later';
      case 'invalid-credential':
      return 'Invalid email or password. Please enter valid ones';
        
      default: return 'Unexpected auth error occured.Please try again';
    }
  }
}