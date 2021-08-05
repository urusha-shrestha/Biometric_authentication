import 'package:local_auth/local_auth.dart';

class Authentication {
  static Future<bool> authenticateWithBiometric() async {
    //creating an instance of the plugin
    final LocalAuthentication localAuthentication = LocalAuthentication();

    //checking if the biometric authentication is supported by the device
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();

    //to check if biometric authentication is accessible from the app
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    //boolean to be returned to know if the user has been authenticated or not
    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
          localizedReason: 'Please complete the biometrics to proceed',
          biometricOnly: true);
    }
    //localizedReason is the message to show when the user is authenticating
    //biometricOnly is set to true to prevent the device from authenticating using pin or pass code
    //useErrorDialogs, if set to true, will check if fingerprint reader exist on the phone and if there is no fingerprint registered, it will attempt to take the user to settings to add one
    //stickyAuth, if set to true, will resume the authentication process one the app resumes after going to background

    return isAuthenticated;
  }
}
