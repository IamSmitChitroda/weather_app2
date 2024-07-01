import 'package:weather_app/headers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController controller = Get.put(ApiController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Get.to(() => const SearchPage());
              },
            ),
            10.height,
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Enter City Name',
                ),
                onChanged: (value) {
                  controller.getAllCities(city: value);
                },
              ),
              Expanded(
                child: controller.allCities.isNotEmpty
                    ? ListView.builder(
                        itemCount: controller.allCities.length,
                        itemBuilder: (context, index) {
                          City city = controller.allCities[index];
                          return ListTile(
                            title: Text(city.name),
                            subtitle: Text(city.country),
                            onTap: () {
                              controller.getCityWeather(city: city);
                            },
                          );
                        },
                      )
                    : const Center(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
