import 'package:flutter/material.dart';
import 'package:olimpiadas_paris/app/core/shared_preferences/shared_preferences_util.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/button_app.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .7,
          width: MediaQuery.of(context).size.width * .6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              const SizedBox(
                height: 20,
              ),
              ButtonApp(
                text: 'ACESSAR',
                onPressed: () async{
                  final navigator = Navigator.of(context);
                  final favoriteCountry =await  SharedPreferencesUtil.getFavoriteCountry();
                  if(favoriteCountry == null){
                    navigator.pushNamedAndRemoveUntil('/favoriteCountry', (route) => false);
                  }else{
                    navigator.pushNamedAndRemoveUntil('/home', (route) => false, arguments: favoriteCountry);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
