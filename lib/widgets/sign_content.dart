import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tawasel/cubits/content_cubit/content_learning_cubit.dart';
import 'package:tawasel/cubits/content_cubit/content_learning_state.dart';
import 'package:tawasel/widgets/content_success_state.dart';

class SignContent extends StatelessWidget {
  const SignContent({
    super.key,
    required this.crossAxisCount,
    required this.categoryName,
  });

  final int crossAxisCount;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ContentCubit()..getContnet(categoryName: categoryName),
      child: BlocBuilder<ContentCubit, ContentState>(
        builder: (context, state) {
          if (state is ContentLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ContentSuccess) {
            final items = state.items.reversed.toList();
            if (items.isEmpty) {
              return Center(
                child: Text(
                  "There is no data now..",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              );
            }
            return ContentSuccessState(crossAxisCount: crossAxisCount, items: items);
          } else if (state is ContentError) {
            return Center(child: Text("خطأ: ${state.message}"));
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
