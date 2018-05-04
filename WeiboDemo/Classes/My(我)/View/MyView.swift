//
//  MyView.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/17.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import SnapKit
import UIKit

class MyView: UIView, UITableViewDataSource, UITableViewDelegate {
    
    var titleMtbAry = [[String]]()
    var subTitleMtbAry = [[String]]()
    var rowHiddenMtbAry = [[Bool]]()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - 初始化
    private func addView() {
        self.titleMtbAry = [[""],
                            ["新的好友"],
                            ["我的故事", "我的相册", "我的赞"],
                            ["微博钱包", "熊猫守护者", "微博运动", "免流量"],
                            ["粉丝服务", "粉丝头条"],
                            ["客服中心"],
                            ["草稿箱"]]
        self.subTitleMtbAry = [[""],
                               [""],
                               ["", "", "收藏，移到这里了"],
                               ["择时大白 AI智投", "种竹子，保护大熊猫栖息地", "心中小目标，生活小热爱!", "流量免费任性玩"],
                               ["写文章、发点评、赚粉丝", "推广博文及账号的利器"],
                               [""],
                               [""]]
        self.rowHiddenMtbAry = [[false],
                                [true],
                                [true, true, true],
                                [false, true, false, false],
                                [true, true],
                                [true],
                                [true]]
        
        self.addSubview(self.tableView)
        self.headView.addSubview(self.leftImgView)
        self.headView.addSubview(self.titleLabel)
        self.headView.addSubview(self.rightImgView)
        
        self.tableView.register(MyTableViewCell.classForCoder(), forCellReuseIdentifier: "myCell")
        self.tableView.register(MyProfileTableViewCell.classForCoder(), forCellReuseIdentifier: "myProfileCell")
        
        self.makeUpdateConstranint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstranint() {
        self.tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        self.leftImgView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(30)
        }
        
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.leftImgView.snp.right).offset(10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(self.rightImgView.snp.left).offset(-10)
        }
        
        self.rightImgView.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(30)
        }
    }
    
    // MARK: - 懒加载
    private lazy var tableView: UITableView = {
        let tableV = UITableView(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tableV.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableV.delegate = self
        tableV.dataSource = self
        tableV.showsHorizontalScrollIndicator = false
        return tableV
    }()
    
    private lazy var headView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    private lazy var leftImgView: UIImageView = {
        let leftImgV: UIImageView = UIImageView(image: #imageLiteral(resourceName: "tab_home_highlighted"))
        return leftImgV
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLab = UILabel()
        titleLab.text = "你的手机号仍是158******762吗?"
        titleLab.font = UIFont.systemFont(ofSize: 14)
        return titleLab
    }()
    
    private lazy var rightImgView: UIImageView = {
        let rightImgV = UIImageView(image: #imageLiteral(resourceName: "tab_home_highlighted"))
        return rightImgV
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
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 140
            }
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 44
        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 6 {
            return 5
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let titleAry = self.titleMtbAry[indexPath.section]
        let subTitleAry = self.subTitleMtbAry[indexPath.section]
        let rowHiddenAry = self.rowHiddenMtbAry[indexPath.section]
        let isHidden = rowHiddenAry[indexPath.row]

        let cell = UITableViewCell()
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "myProfileCell")
            if let mProCell = profileCell as? MyProfileTableViewCell {
                mProCell.updateCell()
                return mProCell
            }
        } else {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if let mCell = myCell as? MyTableViewCell {
                mCell.updateCell(title: titleAry[indexPath.row],
                                 subTitle: subTitleAry[indexPath.row],
                                 rowImg: isHidden,
                                 roundImg: !isHidden)
                return mCell
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return self.headView
        }
        let grayView = UIView()
        grayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return grayView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 6 {
            let grayView = UIView()
            grayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            return grayView
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section = \(indexPath.section), index = \(indexPath.row)")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
