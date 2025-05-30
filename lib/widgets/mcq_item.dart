import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tawasel/Cubits/submit_cubit/submit_cubit.dart';

class McqItem extends StatefulWidget {
  const McqItem({
    super.key,
    required this.text,
    required this.image1,
    required this.image2,
    required this.image3,
    required this.questionId,
    required this.image1Id,
    required this.image2Id,
    required this.image3Id,
  });

  final String text;
  final String image1;
  final String image2;
  final String image3;
  final int questionId;
  final int image1Id;
  final int image2Id;
  final int image3Id;

  @override
  State<McqItem> createState() => _McqItemState();
}

class _McqItemState extends State<McqItem> {
  int? selectedId;

  void select(int imageId) {
    setState(
      () {
        selectedId = imageId;
        BlocProvider.of<SubmitCubit>(context).addAnswer(
          widget.questionId,
          imageId,
        );
      },
    );
  }

  Widget _buildImage(String url, int imageId) {
    return GestureDetector(
      onTap: () => select(imageId),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedId == imageId ? Colors.blue : Colors.transparent,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(4),
        child: Image.network(url, height: 50),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            widget.text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildImage(widget.image1, widget.image1Id),
            _buildImage(widget.image2, widget.image2Id),
            _buildImage(widget.image3, widget.image3Id),
          ],
        ),
      ],
    );
  }
}
