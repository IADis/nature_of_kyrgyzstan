import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/body_text.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/sliver_app_bar.dart';
import '../../../widgets/page_view_images.dart';
import '../../../widgets/smooth_page.dart';

class GorgesDetailsScreen extends StatefulWidget {
  const GorgesDetailsScreen({super.key, required this.documentSnapshot});

  final DocumentSnapshot documentSnapshot;

  @override
  State<GorgesDetailsScreen> createState() => _GorgesDetailsScreenState();
}

class _GorgesDetailsScreenState extends State<GorgesDetailsScreen> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dynamic data = widget.documentSnapshot;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBarWidget(
            image: data['image'],
            name: data['name'],
            sliverHeight: 30,
            containerHeight: 40,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
                height: 400,
                child: PageView(controller: _pageController, children: [
                  PageViewImages(image: data['pageViewImage1']),
                  PageViewImages(image: data['pageViewImage2']),
                  PageViewImages(image: data['pageViewImage3']),
                  PageViewImages(image: data['pageViewImage4']),
                ])),
          ),
          SliverToBoxAdapter(
            child: SmoothIndicatorWidget(
              controller: _pageController,
              count: 4,
              color: AppColors.plantsColors,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: BodyTextWidget(
              text: data['bodyText'].toString().replaceAll('\\n', '\n'),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
        ],
      ),
    );
  }
}
