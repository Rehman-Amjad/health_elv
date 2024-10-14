import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import '../../path_file.dart';

class QuestionAirView extends StatefulWidget {
  const QuestionAirView({super.key});

  @override
  _QuestionAirViewState createState() => _QuestionAirViewState();
}

class _QuestionAirViewState extends State<QuestionAirView> with CacheManager {
  final ScrollController _scrollController = ScrollController();

  List<String> checkBoxList = [];

  ///question implemented
  int queIndex = 0;
  List<Map<String, dynamic>> questions = [];
  List<Map<String, dynamic>> answers = [];
  bool isLoading = true;
  bool allQuestionDone = false;

  @override
  void initState() {
    _addQuestions();
    super.initState();
    loadNewMsg();
  }

  loadNewMsg() {
    Timer(const Duration(seconds: 3), () {
      isLoading = false;
      setState(() {});
      _scrollToBottom();
    });

  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
        title: Text(
          'Health Survey',
          style: GoogleFonts.inter(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: allQuestionDone
          ? FloatingActionButton(
              backgroundColor: AppColors.blackColor,
              onPressed: () {
                saveBool(SharePrefKeys.isQuestionAir, true);
                Get.offAllNamed(RoutesName.dashboardBottomNav);
              },
              child: const Icon(
                Icons.save,
                color: AppColors.whiteColor,
              ),
            )
          : null,
      body: ListView(
        controller: _scrollController,
        children: [
          _predefinedList(),
          allQuestionDone ? const SizedBox.shrink() : _buildChatSystem(),
        ],
      ),
    );
  }

  _buildChatSystem() {
    Map<String, dynamic> firstMap = questions[queIndex];
    List<String> keys = firstMap.keys.toList();
    String questionKey = keys[0];
    return Column(
      children: [
        _buildLoadingSystemTile(questionKey),
        const SizedBox(height: 10),
        isLoading == false
            ? _buildCheckboxGroup(
                options: firstMap[questionKey],
                left: 30.w,
              )
            : const SizedBox.shrink(),
        const SizedBox(height: 10),
        isLoading == false
            ? _buildDoneBtn(question: questionKey)
            : const SizedBox.shrink()
      ],
    );
  }

  _predefinedList() {
    return ListView.builder(
      itemCount: answers.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        Map<String, dynamic> item = answers[index];
        List<String> keys = item.keys.toList();
        String questionKey = keys[0];
        return Column(
          children: [
            _buildSystemTile(questionKey),
            const SizedBox(height: 20),
            _buildUserTile(item[questionKey]),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  _buildSystemTile(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.blackColor,
                )),
            child: ClipOval(
              child: ImageHelper(
                image: AppAssets.logoImage,
                imageType: ImageType.asset,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildLoadingSystemTile(text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.blackColor,
                )),
            child: ClipOval(
              child: ImageHelper(
                image: AppAssets.logoImage,
                imageType: ImageType.asset,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(right: 20.w),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: isLoading
                  ? Text(
                      "Loading...",
                      style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    )
                  : Text(
                      text,
                      style: GoogleFonts.poppins(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    ),
            ),
          )
        ],
      ),
    );
  }

  _buildUserTile(List<String> text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 40.w),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: ListView.builder(
                  itemCount: text.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      textAlign: TextAlign.start,
                      text[index],
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor,
                      ),
                    );
                  }),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 42,
            height: 42,
            padding: const EdgeInsets.all(05),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.blackColor,
                )),
            child: ImageHelper(
              image: AppAssets.profileIcon1,
              imageType: ImageType.svg,
            ),
          ),
        ],
      ),
    );
  }

  _buildDoneBtn({required String question}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              if (checkBoxList.isNotEmpty) {
                answers.insert(queIndex, {question: checkBoxList});
                if (queIndex < 3) {
                  queIndex += 1;
                  isLoading = true;
                  loadNewMsg();
                } else {
                  answers.insert(queIndex, {question: checkBoxList});
                  allQuestionDone = true;
                }
                checkBoxList.clear();
                setState(() {});
              }
            },
            child: Container(
              margin: EdgeInsets.only(left: 50.w, right: 10.w),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: AppColors.blackColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Text(
                textAlign: TextAlign.start,
                "Done",
                style: GoogleFonts.poppins(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxGroup({
    required List<String> options,
    required double left,
  }) {
    return Container(
      margin: EdgeInsets.only(left: left, right: 10.w),
      padding: const EdgeInsets.all(05),
      decoration: const BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10),
        ),
      ),
      child: Column(
        children: options.map((option) {
          return CheckboxListTile(
            checkColor: AppColors.whiteColor,
            activeColor: AppColors.blackColor,
            title: Text(
              option,
              style: GoogleFonts.poppins(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: AppColors.blackColor,
              ),
            ),
            value: checkBoxList.contains(option),
            onChanged: (bool? value) {
              setState(() {
                if (value!) {
                  checkBoxList.add(option);
                } else {
                  checkBoxList.remove(option);
                }
              });
            },
          );
        }).toList(),
      ),
    );
  }

  _addQuestions() {
    questions.add({
      "How often do you exercise?": [
        "Daily",
        "Weekly",
        "Occasionally",
        "Rarely",
        "Never"
      ]
    });
    questions.add({
      "What type of exercise do you engage in? (e.g., cardio, strength training, yoga)":
          [
        "Cardio",
        "Strength",
        "Training",
        "Yoga",
      ]
    });
    questions.add({
      "Do you smoke or consume alcohol?": [
        "Smoke",
        "Alcohol",
        "Both",
      ]
    });
    questions.add({
      "What are your primary health goals based on your recent blood test results?":
          [
        "Improve cholesterol levels",
        "Manage blood sugar",
        "Increase energy levels",
        "Reduce Weight",
        "Gain Weight",
        "Enhance sleep quality",
        "Reduce stress",
        "Other (please specify)"
      ]
    });
  }
}
