part of 'shared.dart';

Future<File> getImageFromDevice() async {
  final _picker = ImagePicker();
  final image = await _picker.getImage(source: ImageSource.gallery);
  final File fileImage = File(image.path);
  return fileImage;
}

Future<String> uploadImage(File image) async {
  String fileName = basename(image.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask task = ref.putFile(image);
  TaskSnapshot snapshot = await task;

  return await snapshot.ref.getDownloadURL();
}
