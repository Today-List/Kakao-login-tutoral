//
//  MyAppDelegate.swift
//  Kakao-login-tutoral
//
//  Created by 봉주헌 on 2023/04/18.
//

import Foundation
import UIKit
import KakaoSDKCommon
import KakaoSDKAuth

class MyAppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let kakaoappkey = Bundle.main.infoDictionary?["KAKAO_NATIVE_APP_KEY"] ?? ""
        
        print("kakaoappkey : \(kakaoappkey)")
        
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: kakaoappkey as! String)
        
        return true
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if (AuthApi.isKakaoTalkLoginUrl(url)) {
            return AuthController.handleOpenUrl(url: url)
        }
        
        return false
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        let sceneConfiguration = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        
        sceneConfiguration.delegateClass = MySceneDelegate.self
        
        return sceneConfiguration
    }
    
}

