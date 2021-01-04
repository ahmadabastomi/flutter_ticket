part of 'widgets.dart';

class PromoCard extends StatelessWidget {
  final PromoModels promoModels;
  PromoCard(this.promoModels);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: mainColor, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promoModels.title,
                    style: whiteTextFont.copyWith(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    promoModels.subtitle,
                    style: whiteTextFont.copyWith(
                        fontSize: 11, fontWeight: FontWeight.w300),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "OFF ",
                    style: yellowNumberFont.copyWith(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                  Text(
                    "${promoModels.discount} %",
                    style: yellowNumberFont.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  )
                ],
              )
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 77.5, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 77.5,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Image.asset("assets/icons/reflection2.png")),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 113, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 113,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                child: Image.asset("assets/icons/reflection1.png"),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.transparent
                  ]).createShader(Rect.fromLTRB(0, 0, 38, 25));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 38,
              child: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(15)),
                child: Image.asset('assets/icons/reflection3.png')
              ),
            ),
          ),
        )
      ],
    );
  }
}
