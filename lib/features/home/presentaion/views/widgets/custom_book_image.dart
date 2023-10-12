import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  //final BorderRadius? borderRadius;

  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 2.6 / 4,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          // placeholder: (context, url) =>
          //     const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}


//  Container(
//         width: 100,
//         height: MediaQuery.of(context).size.height * .25,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           image: DecorationImage(
//             fit: BoxFit.fill,
//             image: NetworkImage(imageUrl),
//           ),
//         ),
//       ),