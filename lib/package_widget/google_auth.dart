import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    // 'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  GoogleSignInAccount? currentUser;

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((event) {
      setState(() {
        currentUser = event;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser != null ? 'Dashboard' : 'Login'),
      ),
      body: currentUser != null
          ? ListTile(
              leading: GoogleUserCircleAvatar(
                identity: currentUser!,
              ),
              title: Text(currentUser!.displayName ?? ''),
              subtitle: Text(currentUser!.email),
              trailing: IconButton(
                onPressed: () async => await _googleSignIn.disconnect(),
                icon: Icon(Icons.logout),
              ),
            )
          : Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: _handleSignIn,
                child: Text('Sign in with Google'),
              ),
            ),
    );
  }
}
