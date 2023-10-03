import 'package:bookly_app/features/home/presentaion/views/widgets/featured_list_view_item.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: FeaturedListViewItem(),
              );
            }),
      ),
    );
  }
}
