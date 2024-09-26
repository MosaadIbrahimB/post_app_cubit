import 'failure.dart';

class FirebaseFailure extends Failure {
  final String code;

  FirebaseFailure({required this.code, required String message}) : super(message);

  @override
  String toString() {
    return "FirebaseFailure(code: $code, message: $message)";
  }

  // يمكنك إضافة ميثود لتقديم رسائل مخصصة بناءً على الكود
  static String getErrorMessage(String code) {
    switch (code) {
      case 'wrong-password':
        return 'The password is invalid.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      default:
        return 'An unknown error occurred with Firebase.';
    }
  }
}
