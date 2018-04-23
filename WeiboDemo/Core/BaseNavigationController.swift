//
//  BaseNavigationController.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/16.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UINavigationBar.appearance().tintColor = UIColor.red
        /* 使导航栏变透明 */
        let naBar = UINavigationBar.appearance()
        naBar.isTranslucent = false
//        naBar.setBackgroundImage(UIImage(), for: .default)
//        naBar.barStyle = .default
//        naBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        // Do any additional setup after loading the view.
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
