import 'package:desafio_web_services/strings.dart';
import 'package:flutter/material.dart';

import '../data/model/results.dart';

class ComicPage extends StatelessWidget {
  const ComicPage({
    Key? key,
    required this.comic,
    required this.imagePath,
  }) : super(key: key);

  final Results comic;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                const Image(
                  image: AssetImage('assets/cover.jpg'),
                  fit: BoxFit.fitHeight,
                  height: 300,
                ),
                Positioned(
                  height: 160,
                  width: 100,
                  left: 10,
                  bottom: -30,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(imagePath),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 48.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                comic.title?.toUpperCase() ?? Strings.noTitleFound,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              child: Text(
                comic.description ?? Strings.noDescriptionFound,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
              ),
              child: getBoldTitleAndNormalContent(
                "${Strings.published}: ",
                getPublishedDate(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
                left: 10.0,
              ),
              child: getBoldTitleAndNormalContent(
                "${Strings.price}: ",
                getPrice(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: getBoldTitleAndNormalContent(
                "${Strings.pages}: ",
                "${comic.pageCount ?? Strings.noPagesFound}",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBoldTitleAndNormalContent(String title, String content) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: content,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  String getPublishedDate() {
    String? date = comic.dates?.elementAt(0).date;
    if (date != null) {
      List<String> splitDate = date.split("T")[0].split("-");
      String formattedDate = "${splitDate[2]}/${splitDate[1]}/${splitDate[0]}";
      return formattedDate;
    } else {
      return Strings.noPublishedDate;
    }
  }

  String getPrice() =>
      "\$ ${comic.prices?.elementAt(0).price ?? Strings.noPriceFound}";
}
