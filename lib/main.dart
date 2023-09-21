import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:img_to_zpl/img_to_zpl.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Img to ZPL',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Img to ZPL'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                const nombreImagen = 'nombreImagen';

                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);

                if (image != null) {
                  final bytes = await image.readAsBytes();
                  final zplBody =
                      await ImgToZpl.convertImgtoZpl(nombreImagen, bytes);

                  final finalZpl =
                      '^XA$zplBody^FO150,150^XGR:$nombreImagen,1,1^FS^XZ';
                  print(finalZpl);
                }
              },
              child: const Text('Seleccionar imagen'),
            ),
          )),
    );
  }
}
