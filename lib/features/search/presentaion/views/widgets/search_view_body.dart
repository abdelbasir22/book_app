import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/search/presentaion/views/widgets/custom_search_text_filed.dart';
import 'package:bookly_app/features/search/presentaion/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back)),
          const CustomSearchTextField(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Search Result',
            style: Styles.textStyle18,
          ),
          const SizedBox(
            height: 20,
          ),
          const Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}
