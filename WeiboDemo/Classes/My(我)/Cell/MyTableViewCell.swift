//
//  MyTableViewCell.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/17.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import SnapKit
import UIKit

class MyTableViewCell: UITableViewCell {

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
    
    // MARK: - 设置cell的值
    public func updateCell(title titleText: String, subTitle subTitleText: String, rowImg rowHidden: Bool, roundImg roundHidden: Bool) {
        self.titleLabel.text = titleText
        self.subTitleLabel.text = subTitleText
        self.rightRowImage.isHidden = rowHidden
        self.rightRoundImage.isHidden = roundHidden
    }
    
    // MARK: - 初始化view
    private func addView() {
        self.contentView.addSubview(self.leftImage)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.subTitleLabel)
        self.contentView.addSubview(self.rightRowImage)
        self.contentView.addSubview(self.rightRoundImage)
        self.contentView.addSubview(self.lineView)
        
        self.makeUpdateConstraint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstraint() {
        self.leftImage.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(36)
        }
        
        self.titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1_000), for: UILayoutConstraintAxis.horizontal)
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.leftImage.snp.right).offset(10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        self.subTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(self.titleLabel.snp.right).offset(10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(self.rightRoundImage.snp.left).offset(-10)
            make.right.equalTo(self.rightRowImage.snp.left).offset(-10)
        }
        
        self.rightRowImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.width.equalTo(30)
            make.bottom.equalTo(-4)
        }
        
        self.rightRoundImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.width.equalTo(30)
            make.bottom.equalTo(-4)
        }
        
        self.lineView.snp.makeConstraints { make in
            make.bottom.equalTo(-0.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
        }
        
    }
    
    // MARK: - 懒加载
    private lazy var leftImage: UIImageView = {
        let image = UIImageView(image: #imageLiteral(resourceName: "tab_home_highlighted"))
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.font = UIFont.systemFont(ofSize: 12)
        subLabel.textColor = UIColor.gray
        return subLabel
    }()
    
    private lazy var rightRowImage: UIImageView = {
        let rowImage = UIImageView(image: #imageLiteral(resourceName: "tab_profile_highlighted"))
        return rowImage
    }()
    
    private lazy var rightRoundImage: UIImageView = {
        let roundImage = UIImageView(image: #imageLiteral(resourceName: "tabbar_compose_button"))
        return roundImage
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView()
        return line
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
