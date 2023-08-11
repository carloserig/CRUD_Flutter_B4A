import 'package:flutter/material.dart';

class TituloSubtitulo extends StatelessWidget {
  const TituloSubtitulo(
      {super.key, required this.titulo, required this.subtitulo});

  final titulo;
  final subtitulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3, top: 12),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          Text(
            '$titulo   ',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[800],
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$subtitulo',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
