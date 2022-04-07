import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_weather_app/ui/home_view/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.getWeather(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: model.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : model.hasError
                      ? const Center(
                          child: Text(
                            'Unable to load data',
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      model.getWeather();
                                    },
                                    icon: const Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () => model.goToCity(),
                                    icon: const Icon(
                                      Icons.location_city,
                                      color: Colors.white,
                                      size: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                              ),
                              child: Text(
                                model.weather.name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              'temperature: ${model.weather.temperature}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'humidity: ${model.weather.humidity}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'condition: ${model.weather.data.main}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
            ),
          ),
        );
      },
    );
  }
}
