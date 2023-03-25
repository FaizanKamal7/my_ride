import UIKit
import Firebase
import FirebaseAuth
import UserNotifications

import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("AIzaSyCLcb0RVCdYgd1QWBZPspiVESTDpF1yLhM")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Auth.auth().setAPNSToken(deviceToken, type: .unknown)
    Messaging.messaging().apnsToken = deviceToken
  }

  override func application(_ application: UIApplication,
    didReceiveRemoteNotification notification: [AnyHashable : Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    if Auth.auth().canHandleNotification(notification) {
      completionHandler(.noData)
      return
    }
  }
}
