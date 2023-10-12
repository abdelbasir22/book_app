import 'package:bookly_app/core/widgets/custom_error_widgit.dart';
import 'package:bookly_app/core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/features/home/presentaion/manger/simlier_books_cubit/similer_books_cubit.dart';
import 'package:bookly_app/features/home/presentaion/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilerBooksListView extends StatelessWidget {
  const SimilerBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilerBooksCubit, SimilerBooksState>(
      builder: (context, state) {
        if (state is SimilerBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImage(
                      imageUrl: state
                              .books[index].volumeInfo!.imageLinks?.thumbnail ??
                          '',
                    ),
                  );
                }),
          );
        } else if (state is SimilerBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndcator();
        }
      },
    );
  }
}
