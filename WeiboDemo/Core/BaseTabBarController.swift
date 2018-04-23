//
//  BaseTabBarController.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/16.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - 初始化控制器
    let homeVC = HomeViewController()
    let messageVC = MessageViewController()
    let composeVC = ComposeViewController()
    let discoverVC = DiscoverViewController()
    let myVC = MyViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addVC()
        // Do any additional setup after loading the view.
    }
    
    // MARK: - 添加控制器
    func addVC() {
        let vcAry: [BaseViewController] = [self.homeVC, self.messageVC, self.composeVC, self.discoverVC, self.myVC]
        let titleAry: [String] = ["首页", "消息", "发布", "发现", "我"]
        let normalImgAry: [String] = ["tabbar_home", "tabbar_message_center", "tabbar_compose_icon_add", "tabbar_discover", "tabbar_profile"]
        let selectImgAry: [String] = ["tab_home_highlighted",
                                      "tab_message_center_highlighted",
                                      "tab_compose_icon_add_highlighted",
                                      "tab_discover_highlighted",
                                      "tab_profile_highlighted"]
        var navMtbAry = [BaseNavigationController]()
        for (index, item) in vcAry.enumerated() {
            navMtbAry.append(getNav(vc: item))
            item.navigationItem.title = titleAry[index]
            item.tabBarItem = UITabBarItem(title: titleAry[index], image: UIImage(named: normalImgAry[index]), selectedImage: UIImage(named: selectImgAry[index]))
        }
        self.viewControllers = navMtbAry
        
    }
    
    // MARK: - 初始化导航控制器
    func getNav(vc: BaseViewController) -> BaseNavigationController {
        return BaseNavigationController(rootViewController: vc)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
