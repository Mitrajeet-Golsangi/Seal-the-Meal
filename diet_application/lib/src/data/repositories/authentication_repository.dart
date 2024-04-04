import 'package:diet_application/src/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository {
  final fb_auth.FirebaseAuth _auth;

  AuthenticationRepository({fb_auth.FirebaseAuth? auth})
      : _auth = auth ?? fb_auth.FirebaseAuth.instance;

  User currentUser = User.empty;

  /// Gives the state of the user in the current session
  ///
  /// @returns a stream of the current user's instance : Stream<User>
  Stream<User> get user {
    return _auth.authStateChanges().map((firebaseUser) {
      final User user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  /// Creates a new user account from the provided email and password
  ///
  /// @param required String email : email address for new account
  /// @param required String password : password for the new account
  Future<void> register({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  /// Signs in the user by taking in the email and password for the
  /// required account
  ///
  /// @param required String email : email address of the user' account
  /// @param required String password : password of the user's account
  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {
      rethrow;
    }
  }

  /// Logs out the user from the current session and terminates the session
  Future<void> logOut() async {
    try {
      Future.wait([_auth.signOut()]);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      if (kIsWeb) {
        fb_auth.GoogleAuthProvider googleProvider =
            fb_auth.GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');
        googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
        await _auth.signInWithRedirect(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = fb_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (_) {
      rethrow;
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final fb_auth.OAuthCredential fbCredential =
          fb_auth.FacebookAuthProvider.credential(
              loginResult.accessToken!.token);

      await _auth.signInWithCredential(fbCredential);
    } catch (_) {
      rethrow;
    }
  }
}

/// Converts the default Firebase user into the custom User model for this
/// application
extension on fb_auth.User {
  User get toUser {
    return User(id: uid, name: displayName, email: email, photo: photoURL);
  }
}
