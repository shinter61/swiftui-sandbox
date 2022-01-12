//
//  SandboxApp.swift
//  Sandbox
//
//  Created by 松本真太朗 on 2021/10/15.
//

import SwiftUI
import GoogleMobileAds

// AppDelegateクラスを定義する
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Mobile Ads SDKを初期化する
        GADMobileAds.sharedInstance().start(completionHandler: nil)
        return true
    }
}

@main
struct SandboxApp: App {
//    init() {
//        GADMobileAds.sharedInstance().start(completionHandler: nil)
//    }
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
