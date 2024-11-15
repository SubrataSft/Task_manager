import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  FirebaseNotificationService._();

  static final FirebaseNotificationService instant =
      FirebaseNotificationService._();

  Future<void> initialize() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print(message.notification?.title);
      print(message.notification?.body);
      print(message.data);
    });

    FirebaseMessaging.onBackgroundMessage(doNothing);
    String? token = await getToken();
    print(token);
  }

  Future<void> onTokenRefresh() async{
    _firebaseMessaging.onTokenRefresh.listen((token){
      
    });
  }

  Future<String?> getToken()async{
    String? token = await _firebaseMessaging.getToken();
    return token;
  }
}

Future<void> doNothing(RemoteMessage message) async {}
