import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Map> l1 = <Map>[].obs;
  RxString clickdata = "".obs;
  RxList<String> data = [
    "surat",
    "ahemdavad",
    "valsad",
    "vadodara",
    "rajkot",
    "surendranagar",
    "amreli"
  ].obs;
  RxList<String> alldata = [
    "surat",
    "ahemdavad",
    "valsad",
    "vadodara",
    "rajkot",
    "surendranagar",
    "amreli"
  ].obs;

  void filterdata(String query) {
    print("====${query}====");
    if (query.isNotEmpty) {
      List<String> filterList = [];
      for (var z in alldata) {
        if (z.toLowerCase().contains(query.toLowerCase())) {
          filterList.add(z);
        }
      }
      data.value = filterList;
    } else {
      data.value = [
        "surat",
        "ahemdavad",
        "valsad",
        "vadodara",
        "rajkot",
        "surendranagar",
        "amreli"
      ];
    }
  }
}
