import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:searchbar/homeScreen/controller/HomeController.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  HomeController homeController = HomeController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Searchview"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  controller: TextEditingController(
                      text: homeController.clickdata.value),
                  onChanged: (value) {
                    homeController.filterdata(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                      itemCount: homeController.data.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            homeController.clickdata.value =
                                homeController.data[index];
                          },
                          child: ListTile(
                            title: Text("${homeController.data[index]}"),
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
