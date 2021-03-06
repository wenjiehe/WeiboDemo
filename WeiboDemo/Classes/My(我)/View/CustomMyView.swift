//
//  CustomMyView.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/18.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import SnapKit
import UIKit

typealias KCallBack = (_ index: Int) -> Void

class CustomMyView: UIView {
    
    var valueBlock: KCallBack?
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        self.addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - 更新view值, number[0] = weibo | number[1] = follow | number[2] = fans
    public func updateView(_ number: [String], _ closure: @escaping KCallBack) {
        self.weiboNumberLabel.text = number[0]
        self.followNumberLabel.text = number[1]
        self.fansNumberLabel.text = number[2]
        self.valueBlock = closure
    }
    
    // MARK: - private 方法
    @objc private func tapAction(_ tap: UITapGestureRecognizer) {
        if let tapView = tap.view {
            self.valueBlock?(tapView.tag - 100)
        }
    }

    // MARK: - 初始化
    private func addView() {
        self.addSubview(self.leftView)
        self.addSubview(self.centerView)
        self.addSubview(self.rightView)
        
        self.leftView.addSubview(self.weiboNumberLabel)
        self.leftView.addSubview(self.weiboLabel)
        
        self.centerView.addSubview(self.followNumberLabel)
        self.centerView.addSubview(self.followLabel)
        
        self.rightView.addSubview(self.fansNumberLabel)
        self.rightView.addSubview(self.fansLabel)
        
        let leftTapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.leftView.addGestureRecognizer(leftTapGes)
        
        let centerTapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.centerView.addGestureRecognizer(centerTapGes)
        
        let rightTapGes = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
        self.rightView.addGestureRecognizer(rightTapGes)
        
        self.makeUpdateConstranint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstranint() {
        self.leftView.snp.makeConstraints { make in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.width.equalTo(UIScreen.main.bounds.size.width / 3)
            make.bottom.equalTo(0)
        }
        
        self.centerView.snp.makeConstraints { make in
            make.left.equalTo(self.leftView.snp.right).offset(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self.leftView.snp.width)
        }
        
        self.rightView.snp.makeConstraints { make in
            make.right.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(self.centerView.snp.width)
        }
        
        self.weiboNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.weiboLabel.snp.makeConstraints { make in
            make.top.equalTo(self.weiboNumberLabel.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.followNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.followLabel.snp.makeConstraints { make in
            make.top.equalTo(self.followNumberLabel.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.fansNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(12)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        self.fansLabel.snp.makeConstraints { make in
            make.top.equalTo(self.fansNumberLabel.snp.bottom)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
    }
    
    // MARK: - 懒加载
    private lazy var leftView: UIView  = {
        let left = UIView()
        left.tag = 100
        return left
    }()
    
    private lazy var centerView: UIView = {
        let center = UIView()
        center.tag = 200
        return center
    }()
    
    private lazy var rightView: UIView = {
        let right = UIView()
        right.tag = 300
        return right
    }()
    
    private lazy var weiboNumberLabel: UILabel = {
        let weiboNumber = UILabel()
        weiboNumber.font = UIFont.systemFont(ofSize: 15)
        weiboNumber.textAlignment = NSTextAlignment.center
        return weiboNumber
    }()
    
    private lazy var weiboLabel: UILabel = {
        let weibo = UILabel()
        weibo.text = "微博"
        weibo.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        weibo.textAlignment = NSTextAlignment.center
        weibo.font = UIFont.systemFont(ofSize: 13)
        return weibo
    }()
    
    private lazy var followNumberLabel: UILabel = {
        let followNumber = UILabel()
        followNumber.font = UIFont.systemFont(ofSize: 15)
        followNumber.textAlignment = NSTextAlignment.center
        return followNumber
    }()
    
    private lazy var followLabel: UILabel = {
        let follow = UILabel()
        follow.text = "关注"
        follow.textColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        follow.textAlignment = NSTextAlignment.center
        follow.font = UIFont.systemFont(ofSize: 13)
        return follow
    }()
    
    private lazy var fansNumberLabel: UILabel = {
        let fansNumber = UILabel()
        fansNumber.font = UIFont.systemFont(ofSize: 15)
        fansNumber.textAlignment = NSTextAlignment.center
        return fansNumber
    }()
    
    private lazy var fansLabel: UILabel = {
        let fans = UILabel()
        fans.text = "粉丝"
        fans.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        fans.textAlignment = NSTextAlignment.center
        fans.font = UIFont.systemFont(ofSize: 13)
        return fans
    }()
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
