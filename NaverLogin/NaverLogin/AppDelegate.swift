//
//  AppDelegate.swift
//  NaverLogin
//
//  Created by soyeon on 2021/12/21.
//

import UIKit
import NaverThirdPartyLogin

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        
        // 네이버 앱으로 인증하는 방식을 활성화
        instance?.isNaverAppOauthEnable = true
        // SafariViewController에서 인증하는 방식을 활성화
        instance?.isInAppOauthEnable = true
        // 인증 화면을 iPhone의 세로 모드에서만 사용하기
        instance?.isOnlyPortraitSupportedInIphone()
        
        
        // 애플리케이션 이름
        instance?.appName = (Bundle.main.infoDictionary?[kCFBundleNameKey as String] as? String) ?? ""
        // 콜백을 받을 URL Scheme
        instance?.serviceUrlScheme = "naverlogin"
        // 애플리케이션에서 사용하는 클라이언트 아이디
        instance?.consumerKey = "vKDDVKkMQ7jfkG3ppWPD"
        // 애플리케이션에서 사용하는 클라이언트 시크릿
        instance?.consumerSecret = "TLz9oZlbXQ"
        
        
        let loginVC = LoginViewController()
        window?.makeKeyAndVisible()
        window?.rootViewController = loginVC
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
        return true
    }
}
