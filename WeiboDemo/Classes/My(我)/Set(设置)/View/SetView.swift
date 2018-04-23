//
//  SetView.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/19.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import SnapKit
import UIKit

class SetView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var titleMtbAry = [[String]]()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - 初始化
    private func addView() {
        self.titleMtbAry = [["账号管理", "账号与安全"],
                            ["消息设置", "屏蔽设置", "隐私设置", "通用设置"],
                            ["清理缓存", "护眼模式"],
                            ["客服中心", "关于微博"]]
        
        self.addSubview(self.tableView)
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstranint() {
        self.tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    // MARK: - 懒加载
    private lazy var tableView: UITableView = {
        let tableV = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tableV.backgroundColor = UIColor.lightGray
        tableV.delegate = self
        tableV.dataSource = self
        tableV.showsHorizontalScrollIndicator = false
        return tableV
    }()
    
    // MARK: - UITableViewDelegate && UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.titleMtbAry.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let ary = self.titleMtbAry[section]
        return ary.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
//    {
//        if section == 6 {
//            return 5
//        }
//        return 0
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
//
//        if indexPath.section == 0{
//            if indexPath.row == 0{
//                let myProfileCell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell", for: indexPath)
//                let profileCell = myProfileCell as? MyProfileTableViewCell
//                if profileCell != nil {
//                    profileCell!.updateCell()
//                }
//                return myProfileCell
//            }
//        }else{
//            let myCell = cell as? MyTableViewCell
//            if myCell != nil {
//                myCell!.updateCell(title: titleAry[indexPath.row],
//                                   subTitle: subTitleAry[indexPath.row],
//                                   rowImg: isHidden,
//                                   roundImg: !isHidden)
//            }
//        }
        return cell
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
//    {
//        if section == 6{
//            let grayView = UIView()
//            grayView.backgroundColor = UIColor.lightGray
//            return grayView
//        }
//        return nil
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index = \(indexPath.row)")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
