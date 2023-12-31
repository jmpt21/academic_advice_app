import 'package:academic_advice_app/model/providers/height_provider.dart';
import 'package:academic_advice_app/model/utils/manipule_ui.dart';
import 'package:academic_advice_app/view/screens/login_screen.dart';
import 'package:academic_advice_app/view/screens/recover_password_screen.dart';
import 'package:academic_advice_app/view/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PresentationScreen extends ConsumerWidget {
  static const String routeName = 'presentation_screen';
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widthScreen = MediaQuery.of(context).size.width;

    final heightLogin = ref.watch(heightLoginProvider);
    final heightRegister = ref.watch(heightRegisterProvider);
    final heightRecoverPassword = ref.watch(heightRecoverPasswordProvider);

    return Scaffold(
      body: Stack(
        children: [
          const SafeArea(child: LogosScreen()),
          const SafeArea(
            child: Align(
              alignment: Alignment.center,
                child: MainScreen()
            )
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: LoginScreen(
                heightLogin: heightLogin,
                widthLogin: widthScreen)
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RegisterScreen(heightRegister: heightRegister, widthRegister: widthScreen),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RecoverPasswordScreen(height: heightRecoverPassword, width: widthScreen),
            ),
          )
        ],
      )
    );
  }
}

class LogosScreen extends StatelessWidget {
  const LogosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/logos/LogoTecnm1.png', scale: 15),
          Image.asset('assets/logos/LogoTecHidalgo.png', scale: 45)
        ],
      ),
    );
  }
}

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightScreen = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Tecnológico Nacional de México\nCampus Ciudad Hidalgo',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              'PROGRAMA DE ASESORÍAS ACADÉMICAS\nDE CIENCIAS BÁSICAS',
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            const Text(
              'AsparTec',
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w800
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: (){
                      hideRegister(ref);
                      showLogin(heightScreen*0.5, ref);
                    },
                    icon: const Icon(Icons.login_sharp),
                    label: const Text('Iniciar sesión')
                ),
              ],
            ),
            const SizedBox(width: 10),
            const Text(
                'o',
                style: TextStyle(
                  fontSize: 16.0,
                )
            ),
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    onPressed: (){
                      hideLogin(ref);
                      showRegister(heightScreen, ref);
                    },
                    icon: const Icon(Icons.app_registration_sharp),
                    label: const Text('Registrarse')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

