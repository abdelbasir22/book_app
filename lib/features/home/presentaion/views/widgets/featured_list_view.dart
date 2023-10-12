import 'package:bookly_app/core/widgets/custom_error_widgit.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentaion/manger/featurd_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
          if (state is FeaturedBooksSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // final book = state.books[index];
                  // final thumbnailUrl = book.volumeInfo?.imageLinks?.thumbnail;
                  // final imageUrl = thumbnailUrl ?? 'any_placeholder_image_';

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: CustomBookImage(
                        imageUrl: state
                            .books[index].volumeInfo!.imageLinks!.thumbnail!),
                  );
                },
              ),
            );
          } else if (state is FeaturedBooksFailure) {
            return CustomErrorWidget(errMessage: state.errmessage);
          } else {
            return const CustomLoadingIndcator();
          }
        },
      ),
    );
  }
}
