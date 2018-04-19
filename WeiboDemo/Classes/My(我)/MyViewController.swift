//
//  MyViewController.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/16.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

class MyViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addView()
    }
    
    //MARK: - 初始化
    private func addView()
    {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: self.leftNavBtn)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: self.rightNavBtn)
        self.view.addSubview(self.myView)
        self.makeUpdateConsrtaint()
    }
    
    //MARK: - 添加约束
    private func makeUpdateConsrtaint()
    {
        self.myView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalTo(0)
        }
        
    }
    
    //MARK: - 懒加载
    private lazy var leftNavBtn : UIButton = {
        let leftBtn = UIButton()
        leftBtn.setTitle("添加好友", for: UIControlState.normal)
        leftBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        leftBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        leftBtn.addTarget(self, action: #selector(addFriendsAction(_:)), for: UIControlEvents.touchUpInside)
        return leftBtn
    }()
    
    private lazy var rightNavBtn : UIButton = {
        let rightBtn = UIButton()
        rightBtn.setTitle("设置", for: UIControlState.normal)
        rightBtn.setTitleColor(UIColor.black, for: UIControlState.normal)
        rightBtn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        rightBtn.addTarget(self, action: #selector(setAction(_:)), for: UIControlEvents.touchUpInside)
        return rightBtn
    }()

    
    private lazy var myView : MyView = {
        let view = MyView()
        return view
    }()
    
    //MARK: - Action
    @objc private func addFriendsAction(_ btn : UIButton)
    {
        print("btn = \(btn)")
        print("添加好友")
    }
    
    @objc private func setAction(_ btn : UIButton)
    {
        print("设置")
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
