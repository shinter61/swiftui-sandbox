//
//  BannerView.swift
//  Sandbox
//
//  Created by 松本真太朗 on 2021/12/24.
//

import SwiftUI
import GoogleMobileAds

struct BannerView: UIViewRepresentable {
    func makeUIView(context: Context) -> GADBannerView {
        let banner = GADBannerView(adSize: GADAdSizeBanner)
        #if DEBUG
            banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        #else
            banner.adUnitID = "ca-app-pub-7488758522758420/6412145975"
        #endif
        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }

    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}
