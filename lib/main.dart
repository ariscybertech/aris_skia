import 'dart:ui';

final PlatformDispatcher platformDispatcher = PlatformDispatcher.instance;

void main() {
   platformDispatcher.onBeginFrame = frame;
   platformDispatcher.scheduleFrame();
}

void frame(Duration duration) {
  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = const Color(0xFFFFFFFF);
  canvas.drawCircle(Offset.zero, 100, paint);
  canvas.drawLine(Offset.zero, Offset(200, 200), paint);
  final Picture picture = pictureRecorder.endRecording();
  final SceneBuilder sceneBuilder = SceneBuilder()
  ..pushOffset(200, 200)
  ..addPicture(Offset.zero, picture);
  platformDispatcher.views.first.render(sceneBuilder.build());
}