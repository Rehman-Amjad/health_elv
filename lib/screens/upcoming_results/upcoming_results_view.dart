import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_elev8_app/path_file.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../flagged_result/export.dart';

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
                    child: const Text(
                      '12',
                      style: TextStyle(
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
                itemCount: 01,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return resultItem();
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
      height: 250,
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
            color: Theme.of(context).primaryColor,
          ),
        ),
        monthCellBuilder: _monthCellBuilder,
        todayTextStyle: GoogleFonts.inter(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w700,
          fontSize: 18,
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

  Widget _monthCellBuilder(context, MonthCellDetails details) {
    //final bool isToday = isSameDate(dateTime, DateTime.now());
    DateTime dateTime = details.date;
    final bool isSpecialDate = isSpecialDay(dateTime);
    return Container(
      decoration: controller.tempDate == dateTime
          ? todayDecoration
          : isSpecialDate
              ? otherDayDecoration
              : null,
      margin: const EdgeInsets.symmetric(vertical: 00),
      alignment: Alignment.center,
      child: Text(
        dateTime.day.toString(),
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          color: controller.tempDate == dateTime
              ? AppColors.blackColor
              : AppColors.fieldColor,
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  final BoxDecoration todayDecoration = BoxDecoration(
    color: AppColors.primaryColor,
    shape: BoxShape.circle,
  );

  final BoxDecoration otherDayDecoration = BoxDecoration(
    border: Border.all(
      color: AppColors.primaryColor,
      width: 2,
    ),
    shape: BoxShape.circle,
  );

  bool isSpecialDay(DateTime date) {
    bool result = false;
    // if (controller.availableSlots.value.data != null) {
    //   for (var element in controller.availableSlots.value.data!.dateKeys!) {
    //     String calenderDate = DateTimeUtils.dayMonthYear(date.toString());
    //     if (calenderDate == element) {
    //       result = true;
    //     }
    //   }
    // }
    return result;
  }

  resultItem() {
    return Card(
      child: Container(
        height: 140,
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Serum LDH",
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                    AppText(
                      text: "For Cardiovascular Function Test",
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppText(
                  text: "26 June 2024 - 4 PM",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                CustomButton(
                  text: 'Check Result',
                  width: 130,
                  height: 44,
                  isGradient: true,
                  onTap: () {
                    Get.to(
                      () => const FlaggedResultView(),
                    );
                  },
                  backgroundColor: AppColors.blackColor,
                  fontSize: 13,
                  radios: 05,
                  showSuffix: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
