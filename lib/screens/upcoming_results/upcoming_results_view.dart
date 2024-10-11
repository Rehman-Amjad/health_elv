import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class UpcomingResultsView extends GetView<UpcomingResultsController> {
  const UpcomingResultsView({super.key});

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
              SizedBox(height: 02.h),
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
              controller.isLoading.isFalse
                  ? controller.bloodTestList.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.bloodTestList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            OrderBloodTest item =
                                controller.bloodTestList[index];
                            return resultItem(item);
                          },
                        )
                      : Center(
                          child: Text(
                            "No UpComing Blood Test",
                            style: GoogleFonts.poppins(
                              color: AppColors.blackColor,
                            ),
                          ),
                        )
                  : Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
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
        initialSelectedDate: DateTime.now(),
        selectionDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
        ),
        todayTextStyle: GoogleFonts.poppins(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        todayHighlightColor: Colors.black87,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: Colors.white,
          textStyle: GoogleFonts.poppins(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        headerHeight: 40,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.none,
        ),
        monthCellBuilder: (BuildContext context, MonthCellDetails details) {
          bool hasTest = controller.dotsBloodTestList.any((test) {
            DateTime testDate = test.testDate!.toDate();
            DateTime calendarDate = details.date;
            return testDate.year == calendarDate.year &&
                testDate.month == calendarDate.month &&
                testDate.day == calendarDate.day;
          });

          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
            ),
            child: Stack(
              children: [
                Center(
                  child: Text(
                    '${details.date.day}',
                    style: TextStyle(
                      color: hasTest ? Colors.red : Colors.black,
                      fontWeight: hasTest ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
                if (hasTest)
                  const Positioned(
                    bottom: 5,
                    right: 5,
                    child: Icon(
                      Icons.circle,
                      size: 8,
                      color: Colors.red, // Customize the dot color
                    ),
                  ),
              ],
            ),
          );
        },
        onTap: (details) {
          controller.getAllOrderBloodTests(filterDate: details.date!);
        },
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
                      text:
                          '${item.shippingAddress!["firstName"]} ${item.shippingAddress!["lastName"]}',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 02.h),
            AppText(
              text: 'Test Date: ${formatDate(item.testDate!.toDate())}',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
            const SizedBox(height: 02),
            AppText(
              text: 'Address: ${item.shippingAddress!["address"]}',
              fontSize: 12,
              fontWeight: FontWeight.w500,
            )
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('MM/dd/yyyy').format(date);
  }
}
