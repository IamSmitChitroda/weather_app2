import 'package:weather_app/headers.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    ApiController controller = Get.find<ApiController>();
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Search Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: controller.allCities.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.allCities.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text(controller.allCities[index].name),
                      subtitle: listTileSubtitle(
                        index: index,
                        controller: controller,
                      ),
                      onTap: () async {
                        await controller.getCityWeather(
                          city: controller.allCities[index],
                        );
                        Get.back();
                      },
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
