import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nature_of_kyrgyzstan/components/app_colors.dart';
import 'package:nature_of_kyrgyzstan/screens/nature_screen/mountains/canyons/detail_canyons_screen.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/app_bar.dart';
import 'package:nature_of_kyrgyzstan/screens/widgets/list_view_items.dart';
import 'package:page_transition/page_transition.dart';

class CanyonsScreen extends StatefulWidget {
  const CanyonsScreen({super.key});

  @override
  State<CanyonsScreen> createState() => _CanyonsScreenState();
}

class _CanyonsScreenState extends State<CanyonsScreen> {
  Stream<QuerySnapshot> canyons = FirebaseFirestore.instance
      .collection('canyons')
      .orderBy('name')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: const AppBarWidget(),
      body: StreamBuilder(
        stream: canyons,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('ERROR'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasData) {
            return ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 15),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final data = snapshot.data!.docs[index];
                return ListViewItems(
                  image: data['image'],
                  name: data['name'],
                  navigate: () => Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(seconds: 1),
                      reverseDuration: const Duration(seconds: 1),
                      type: PageTransitionType.rightToLeft,
                      child: CanyonsDetailScreen(documentSnapshot: data),
                    ),
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
