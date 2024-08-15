import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:olimpiadas_paris/app/core/shared_preferences/shared_preferences_util.dart';
import 'package:olimpiadas_paris/app/core/ui/base_state/base_state.dart';
import 'package:olimpiadas_paris/app/core/ui/styles/text_styles.dart';
import 'package:olimpiadas_paris/app/core/ui/widgets/olimpic_app_bar.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_controller.dart';
import 'package:olimpiadas_paris/app/pages/favorite_country/favorite_country_state.dart';

class FavoriteCountryPage extends StatefulWidget {
  const FavoriteCountryPage({super.key});

  @override
  State<FavoriteCountryPage> createState() => _FavoriteCountryPageState();
}

class _FavoriteCountryPageState
    extends BaseState<FavoriteCountryPage, FavoriteCountryController> {
  final _searcEC = TextEditingController();

  @override
  void onReady() {
    controller.getAllCountries();
    super.onReady();
  }

  @override
  void dispose() {
    _searcEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteCountryController, FavoriteCountryState>(
      listener: (context, state) {
        state.status.matchAny(
          any: () => hideLoader(),
          loading: () => showLoader(),
          error: () {
            hideLoader();
            showError(state.errorMessage ?? 'Erro desconhecido');
          },
        );
      },
      builder: (context, state) {
        return Scaffold(
          appBar: OlimpicAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    controller: _searcEC,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Pesquisar...',
                    ),
                    onChanged: (value) => controller.searchCountry(value: value),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Selecione seu país favorito',
                    style: context.textStyle.titleBold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.searchContries.length,
                  itemBuilder: (context, index) {
                    final country = state.searchContries[index];
                    return ListTile(
                      onTap: () async {
                        final navigator = Navigator.of(context);
                        await SharedPreferencesUtil.saveFavoriteCountry(country);
                        navigator.pushNamedAndRemoveUntil("/home", (route) => false, arguments: country);
                      },
                      leading: Image.network(
                        country.flagUrl,
                        width: 40,
                      ),
                      title: Text(country.name),
                      trailing: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
