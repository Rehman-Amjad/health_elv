import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

import '../../../path_file.dart';

class PrivacyAndTermsView extends StatefulWidget {
  final String title;
  final String content;

  const PrivacyAndTermsView({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  State<PrivacyAndTermsView> createState() => _PrivacyAndTermsViewState();
}

class _PrivacyAndTermsViewState extends State<PrivacyAndTermsView> {
  final _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
  }

  // Function to load existing terms and conditions
  Future<quill.QuillController> _loadTerms() async {
    DocumentSnapshot doc =
        await _firestore.collection('admin').doc('termsAndConditions').get();
    if (doc.exists) {
      final content = doc['content'];
      return quill.QuillController(
        document: quill.Document.fromJson(content),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
    return quill.QuillController.basic();
  }

  // Function to load existing terms and conditions
  Future<quill.QuillController> _loadPrivacyPolicy() async {
    DocumentSnapshot doc =
        await _firestore.collection('admin').doc('privacyPolicy').get();
    if (doc.exists) {
      final content = doc['content'];
      return quill.QuillController(
        document: quill.Document.fromJson(content),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
    return quill.QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: CustomAppBar(
          marginTop: 30,
          title: widget.title,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: FutureBuilder<quill.QuillController>(
          future: widget.title == "Terms & Conditions"
              ? _loadTerms()
              : _loadPrivacyPolicy(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error loading data'),
              );
            }
            return quill.QuillEditor(
              controller: snapshot.data!,
              focusNode: FocusNode(),
              scrollController: ScrollController(),
            );
          },
        ),
      ),
    );
  }
}
