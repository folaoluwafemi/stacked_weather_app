import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_weather_app/ui/city_screen/city_viewmodel.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CityViewModel>.reactive(
      viewModelBuilder: () => CityViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(),
          ),
        );
      },
    );
  }
}
