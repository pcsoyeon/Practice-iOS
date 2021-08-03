//
//  TabbarController.swift
//  FoodD-day
//
//  Created by soyeon on 2021/08/01.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .fdMainGreen
        
        let mainSB = UIStoryboard.init(name: "Main", bundle: nil)
        let mainTab = mainSB.instantiateViewController(identifier: "NaviController")
        mainTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tap1Off"), selectedImage: UIImage(named: "tap1On"))
        
        
        let mypageSB = UIStoryboard.init(name: "Mypage", bundle: nil)
        let mypageTab = mypageSB.instantiateViewController(identifier: "NaviController")
        mypageTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "tap5Off"), selectedImage: UIImage(named: "tap5On"))
        
        let tabs =  [mainTab, mypageTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = mainTab
    }
}
