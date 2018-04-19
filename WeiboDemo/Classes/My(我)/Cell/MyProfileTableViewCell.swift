//
//  MyProfileTableViewCell.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/18.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

class MyProfileTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - 更新cell
    public func updateCell()
    {
        self.customMyView.updateView(["50", "30", "20"]) { (index) in
            print("index = \(index)")
        }
    }
    
    //MARK: - 初始化view
    private func addView()
    {
        self.contentView.addSubview(self.headImage)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.briefLabel)
        self.contentView.addSubview(self.rightImage)
        self.contentView.addSubview(self.lineView)
        self.contentView.addSubview(self.customMyView)
        
        self.makeUpdateConstraint()
    }
    
    //MARK: - 添加约束
    private func makeUpdateConstraint()
    {
        self.headImage.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        
        self.nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(self.headImage.snp.right).offset(10)
            make.right.equalTo(self.rightImage.snp.left).offset(10)
            make.height.equalTo(25)
        }
        
        self.briefLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(0)
            make.left.equalTo(self.headImage.snp.right).offset(10)
            make.right.equalTo(self.rightImage.snp.left).offset(10)
            make.height.equalTo(25)
        }
        
        self.rightImage.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.right.equalTo(-10)
            make.width.equalTo(50)
            make.height.equalTo(60)
        }
        
        self.lineView.snp.makeConstraints { (make) in
            make.top.equalTo(self.headImage.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
        }
        
        self.customMyView.snp.makeConstraints { (make) in
            make.top.equalTo(self.lineView.snp.bottom).offset(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(60)
        }
    }
    
    //MARK: - 懒加载
    private lazy var headImage : UIImageView = {
        let image = UIImageView.init(image: UIImage.init(named: "tabbar_home_highlighted"))
        return image
    }()
    
    private lazy var nameLabel : UILabel = {
        let name = UILabel()
        name.text = "夕阳下的池塘"
        name.font = UIFont.systemFont(ofSize: 16)
        return name
    }()
    
    private lazy var briefLabel : UILabel = {
        let brief = UILabel()
        brief.text = "简介:暂无介绍"
        brief.textColor = UIColor.lightGray
        brief.font = UIFont.systemFont(ofSize: 13)
        return brief
    }()
    
    private lazy var rightImage : UIImageView = {
        let rightImg = UIImageView.init(image: UIImage.init(named: "tabbar_home_highlighted"))
        return rightImg
    }()
    
    private lazy var lineView : UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    private lazy var customMyView : CustomMyView = {
        let myView = CustomMyView()
        return myView
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
