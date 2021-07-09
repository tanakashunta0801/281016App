//
//  _81016AppApp.swift
//  281016App
//
//  Created by 田中俊多 on 2021/05/13.
//

import SwiftUI
import Firebase
import GoogleMobileAds


@main
struct _81016AppApp: App {
     @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}




class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // (1)Firebase の初期化
        FirebaseApp.configure()
        // (2)AdMob の初期化
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}
