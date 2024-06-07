import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toonflix/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(
                CurveTween(curve: curve),
              );
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, animation, secondaryAnimation) =>
                DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 15,
                    offset: Offset(10, 10),
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  )
                ]),
            child: Image.network(
              thumb,
              headers: const {'Referer': 'http://comic.naver.com'},
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
