import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:health_elev8_app/widgets/custom_button.dart';

class NutrationTips extends StatelessWidget {
  const NutrationTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const AppText(
          text: 'Nutritional Tips', fontSize: 24, fontWeight: FontWeight.bold,),
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ImageHelper(
              image: AppAssets.backIcon,
              imageType: ImageType.svg,
            ),
          ),
          onTap: () => Get.back(),
        ),

      ),
      body:  Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children:[
            SizedBox(height: 20,),
             const AppText(
              text: 'Nutritional Tips', fontSize: 24, fontWeight: FontWeight.bold,),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color:Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
            ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                const Expanded(child: AppText(text: 'Increase intake of vegetables',fontSize: 19,fontWeight:FontWeight.bold,softWrap: true,textAlign: TextAlign.start,)),
                  SizedBox(width: 50,height: 50,child: Image.asset(AppAssets.leafIcon),)
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: CustomButton(text: 'Learn more', onTap: (){},fontSize: 20,),
            )

          ],
        ),
      ),
    );
  }
}
