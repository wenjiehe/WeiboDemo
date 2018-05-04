//
//  SetViewController.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/19.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

class SetViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.addView()
    }
    
    // MARK: - 初始化
    private func addView() {
        self.title = "设置"
        self.view.addSubview(self.baseView)
        self.makeUpdateConsrtaint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConsrtaint() {
        self.baseView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(0)
        }
    }
    
    // MARK: - 懒加载
    private lazy var baseView: SetView = {
        let view = SetView()
        return view
    }()
    
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
