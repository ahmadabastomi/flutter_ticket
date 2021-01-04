part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final MovieModels movieModels;
  ComingSoonCard(this.movieModels);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image:
                  NetworkImage(imageBaseURL + "w780" + movieModels.posterPath),
              fit: BoxFit.cover)),
    );
  }
}
