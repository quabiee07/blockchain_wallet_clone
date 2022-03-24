import 'package:local_auth/local_auth.dart';

class LocalAuthAPI {
  static final _auth = LocalAuthentication();

  // static Future<bool> authenticate() async {

  //   final isAvailable = await hasBiometrics();
  //   final isBiometricsSupported = await isBiometricSupported();
  //   if(!isAvailable && !isBiometricsSupported) return false;

  //   try{
  //      return await _auth.authenticate(
  //       localizedReason: 'Use your biometrics to log into the wallet',
  //       biometricOnly: true, 
  //       useErrorDialogs: true,
  //       stickyAuth: true,
        
  //       );
  //   } on PlatformException catch(e){
  //     return false;
  //   }

  // }

  // static Future<bool> hasBiometrics() async {
  //   try{
  //     return await _auth.canCheckBiometrics;
  //   } on PlatformException catch(e){
  //     return false;
  //   }
  // }

  // static Future<bool> isBiometricSupported() async {
  //   return await _auth.isDeviceSupported();
    
  // }

   static Future<bool> authenticate() async {
    final LocalAuthentication localAuthentication = LocalAuthentication();
    bool isBiometricSupported = await localAuthentication.isDeviceSupported();
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;

    bool isAuthenticated = false;

    if (isBiometricSupported && canCheckBiometrics) {
      isAuthenticated = await localAuthentication.authenticate(
        localizedReason: 'Use your biometrics to log into the wallet',
        biometricOnly: true,
      );
    }

    return isAuthenticated;
  }

}
