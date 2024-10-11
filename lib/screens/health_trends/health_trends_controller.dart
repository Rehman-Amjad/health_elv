import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';

class HealthTrendsController extends BaseController {

  @override
  void onInit() {
    ///to do get data
    super.onInit();
  }


  List<CategoryModel> getCategoryList() {
    return [
      CategoryModel(title: "Hormonal Health", image: AppAssets.img86),
      CategoryModel(title: "Vitamin Health", image: AppAssets.img87),
      CategoryModel(title: "Urine Health", image: AppAssets.img88),
      CategoryModel(title: "Heart Health", image: AppAssets.img89),
      CategoryModel(title: "Thyroid Health", image: AppAssets.img90),
      CategoryModel(title: "Lipid Health", image: AppAssets.img91),
      CategoryModel(title: "Blood Health", image: AppAssets.img92),
      CategoryModel(title: "Liver Health", image: AppAssets.img93),
      CategoryModel(title: "Kidney Health", image: AppAssets.img94),
    ];
  }
}

class CategoryModel {
  String? title;
  String? image;

  CategoryModel({
    this.title,
    this.image,
  });
}
