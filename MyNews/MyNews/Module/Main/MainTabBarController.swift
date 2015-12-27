//
//  MainTabBarController.swift
//  MyNews
//
//  Created by 赫腾飞 on 15/12/23.
//  Copyright © 2015年 hetefe. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChildViewControllers()
    }

    
    private func addChildViewControllers(){
        
        addChildViewController("新闻搜索", imageName: "tabbar_discover", VC: SearchTableViewController())
        addChildViewController("实时热点", imageName: "compose_mentionbutton_background", VC: HotTableViewController())
        addChildViewController("我", imageName: "tabbar_profile", VC: MeTableViewController())
        
    }
    
    private func addChildViewController(title: String, imageName: String, VC: UIViewController) {
        
        let nav = UINavigationController(rootViewController: VC)
        
        nav.title = title
        nav.tabBarItem.image = UIImage(named: imageName)
        self.addChildViewController(nav)
    }
    
}
