import 'package:arsync_exception_toolkit/arsync_exception_toolkit.dart';
import 'package:arsync_firebase_errors_handler/arsync_firebase_errors_handler.dart';

final exceptionToolkit = ArsyncExceptionToolkit(
  handlers: [FirebaseErrorsHandler()],
);
