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
    var typeMtbAry = [[SetCellStyle]]()

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
        self.typeMtbAry = [[SetCellStyle.arrow, SetCellStyle.arrow],
                           [SetCellStyle.arrow, SetCellStyle.arrow, SetCellStyle.arrow, SetCellStyle.arrow],
                           [SetCellStyle.textAndArrow, SetCellStyle.onOFF],
                           [SetCellStyle.newText, SetCellStyle.arrow]]
        
        self.addSubview(self.tableView)
        self.footerView.addSubview(self.exitBtn)
        self.tableView.tableFooterView = self.footerView

        self.tableView.register(SetTableViewCell.classForCoder(), forCellReuseIdentifier: "setCell")
        self.makeUpdateConstranint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstranint() {
        self.tableView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
        
        self.footerView.snp.makeConstraints { make in
            make.top.equalTo(self.tableView.snp.bottom).offset(0)
            make.width.equalTo(UIScreen.main.bounds.size.width)
            make.height.equalTo(64)
        }

        self.exitBtn.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(44)
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
    
    private lazy var footerView: UIView = {
        let footer = UIView()
        footer.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        return footer
    }()
    
    private lazy var exitBtn: UIButton = {
        let exit = UIButton()
        exit.setTitle("退出当前账户", for: UIControlState.normal)
        exit.setTitleColor(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), for: UIControlState.normal)
        exit.titleLabel?.textAlignment = NSTextAlignment.center
        exit.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        exit.addTarget(self, action: #selector(exitAction(_:)), for: UIControlEvents.touchUpInside)
        return exit
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
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        tableView.separatorInset = UIEdgeInsets.zero
        tableView.layoutMargins = UIEdgeInsets.zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cel = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell")
        if let setCell = cell as? SetTableViewCell {
            let titleAry = self.titleMtbAry[indexPath.section]
            let typeAry = self.typeMtbAry[indexPath.section]
            setCell.updateCell(titleAry[indexPath.row], typeAry[indexPath.row])
            return setCell
        }
        return cel
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let grayView = UIView()
        grayView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return grayView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("index = \(indexPath.row)")
    }
    
    // MARK: - 私有方法
    @objc private func exitAction(_ btn: UIButton) {
        print("退出了当前账户")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
