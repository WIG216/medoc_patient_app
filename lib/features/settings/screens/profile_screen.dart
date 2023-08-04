import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:medoc_patient_app/common/utils/colors.dart';
import 'package:medoc_patient_app/common/utils/gap.dart';
import 'package:medoc_patient_app/common/utils/text_style.dart';
import 'package:medoc_patient_app/common/widgets/custom_appbar.dart';
import 'package:settings_ui/settings_ui.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void authenticateUser() async {
    final localAuth = LocalAuthentication();

    try {
      bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      if (canCheckBiometrics) {
        List<BiometricType> availableBiometrics =
            await localAuth.getAvailableBiometrics();
        if (availableBiometrics.contains(BiometricType.iris)) {
          bool authenticated = await localAuth.authenticate(
            localizedReason: 'Authenticate to access the app',
            options: const AuthenticationOptions(
              useErrorDialogs: false,
            ),

            // useErrorDialogs: true,
            // stickyAuth: true,
          );

          if (authenticated) {
            // User authenticated successfully
            print('Biometric authentication successful');
          } else {
            // User did not authenticate
            print('Biometric authentication failed');
          }
        } else {
          // Fingerprint authentication not available
          print(availableBiometrics);

          print('Fingerprint authentication not available');
        }
      } else {
        // Biometric authentication not available
        print('Biometric authentication not available');
      }
    } catch (e) {
      // Handle any errors that occurred during authentication
      print('Biometric authentication error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    bool currentState = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFf2f2f7),
        title: Text(
          'Settings',
          // style: TextStyle(
          //   color: Colors.white,
          // ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - 100,
                child: SettingsList(
                  platform: DevicePlatform.iOS,
                  sections: [
                    SettingsSection(
                      title: Text('Common'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: Icon(Icons.language),
                          title: Text('Language'),
                          value: Text(
                            "English",
                            style: bodyStyle.copyWith(
                              color: subtitleColor,
                            ),
                          ),

                          // value: Text('English'),
                        ),
                        SettingsTile.navigation(
                          onPressed: (context) => authenticateUser(),
                          leading: Icon(CupertinoIcons.cloud),
                          title: Text('Environment'),
                          value: Text(
                            "Production",
                            style: bodyStyle.copyWith(
                              color: subtitleColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Text('Account'),
                      tiles: <SettingsTile>[
                        SettingsTile.navigation(
                          leading: Icon(Icons.phone),
                          title: Text('Phone Number'),
                        ),
                        SettingsTile.navigation(
                          leading: Icon(CupertinoIcons.mail_solid),
                          title: Text('Email'),
                        ),
                        SettingsTile.navigation(
                          leading: Icon(Icons.logout_outlined),
                          title: Text('Sign Out'),
                        ),
                      ],
                    ),
                    SettingsSection(
                      title: Text('Security'),
                      tiles: <SettingsTile>[
                        SettingsTile.switchTile(
                          onToggle: (value) {
                            setState(() {
                              currentState = true;
                            });
                            authenticateUser;
                          },
                          initialValue: currentState,
                          leading: Icon(Icons.fingerprint),
                          title: Text('Use Biometric'),
                        ),
                        // SettingsTile.switchTile(
                        //   onToggle: (value) {},
                        //   initialValue: true,
                        //   leading: Icon(Icons.format_paint),
                        //   title: Text('Enable custom theme'),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
