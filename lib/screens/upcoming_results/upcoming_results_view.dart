import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsView extends GetView<UpcomingResultsController> {
  UpcomingResultsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpcomingResultsController>(
      initState: (_) {
        Get.put(UpcomingResultsController());
      },
      builder: (_) {
        return Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: CustomAppBar(
              title: "Upcoming Blood Tests",
              marginTop: 20,
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              SizedBox(height: 04.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'My Tests ',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 32,
                    width: 32,
                    decoration: BoxDecoration(
                        color: AppColors.redColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(06)),
                    alignment: Alignment.center,
                    child: Text(
                      '${controller.bloodTestList.length}',
                      style: const TextStyle(
                        color: AppColors.redColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 03.h),
              getCalendarFilter(context),
              const SizedBox(height: 16),
              ListView.builder(
                itemCount: controller.bloodTestList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  OrderBloodTest item = controller.bloodTestList[index];
                  return resultItem(item);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  getCalendarFilter(context) {
    return SizedBox(
      height: 280,
      child: SfCalendar(
        controller: controller.monthController,
        view: CalendarView.month,
        backgroundColor: Colors.white,
        showNavigationArrow: true,
        showDatePickerButton: false,
        cellBorderColor: Colors.transparent,
        selectionDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Theme.of(context).primaryColor,
          ),
        ),
        //monthCellBuilder: _monthCellBuilder,
        todayTextStyle: GoogleFonts.inter(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        todayHighlightColor: Colors.black87,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: Colors.white,
          textStyle: GoogleFonts.inter(
            color: AppColors.fieldColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        headerHeight: 40,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.none,
        ),
        onTap: (details) {},
        onViewChanged: (details) {},
        onSelectionChanged: (details) {},
      ),
    );
  }

  resultItem(OrderBloodTest item) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 64,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: AppColors.primaryColor.withOpacity(0.80),
                  ),
                  child: ImageHelper(
                    image: AppAssets.icTestTube,
                    imageType: ImageType.asset,
                    color: AppColors.whiteColor,
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: '${item.testType}',
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    AppText(
                      text: '${item.testCategory}',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      text: '${item.testSubCategory}',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 02.h),
            AppText(
              text: '${item.testDate}',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(height: 02),
            AppText(
              text: '${item.shippingAddress!["address"]}',
              fontSize: 12,
              fontWeight: FontWeight.w400,
            )
          ],
        ),
      ),
    );
  }
}
