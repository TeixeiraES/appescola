import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class AppEscolaResponsaveisAuthUser {
  AppEscolaResponsaveisAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AppEscolaResponsaveisAuthUser>
    appEscolaResponsaveisAuthUserSubject =
    BehaviorSubject.seeded(AppEscolaResponsaveisAuthUser(loggedIn: false));
Stream<AppEscolaResponsaveisAuthUser> appEscolaResponsaveisAuthUserStream() =>
    appEscolaResponsaveisAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
