import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class AppEscolaProfessoresBetaAuthUser {
  AppEscolaProfessoresBetaAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AppEscolaProfessoresBetaAuthUser>
    appEscolaProfessoresBetaAuthUserSubject =
    BehaviorSubject.seeded(AppEscolaProfessoresBetaAuthUser(loggedIn: false));
Stream<AppEscolaProfessoresBetaAuthUser>
    appEscolaProfessoresBetaAuthUserStream() =>
        appEscolaProfessoresBetaAuthUserSubject
            .asBroadcastStream()
            .map((user) => currentUser = user);
