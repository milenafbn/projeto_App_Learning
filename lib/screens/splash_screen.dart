import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'autenticacao_tela.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> 
  with SingleTickerProviderStateMixin {

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive); //some com a barra de status

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const AutenticacaoTela(),)
      );
    });

  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, 
    overlays: SystemUiOverlay.values); //reaparece a barra de status
    super.dispose(); //reaparece a barra de status
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Color.fromRGBO(148, 121, 194, 1), Color.fromRGBO(126, 87, 194, 1)],
            center: Alignment.center,
            radius: 1.0,
          ),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        
      ),
    );
  }
}