import 'package:flutter/material.dart';
import '../../../../shared/util/value/const_colors.dart';

class BuildHeader extends StatelessWidget {
  final String titulo;
  final BuildContext context;
  final String screen;
  const BuildHeader({
    Key? key,
    required this.titulo,
    required this.context,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 32.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(21.0),
          bottomRight: Radius.circular(21.0),
        ),
        boxShadow: [
          BoxShadow(
            color: ConstColors.colorSkyMagenta,
            blurRadius: 10.0,
          ),
        ],
        color: ConstColors.colorSpaceCadet,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 5.0),
          ListTile(
            title: Text(
              titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 21.0,
                color: ConstColors.colorLavenderFloral,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
        ],
      ),
    );
  }
}
