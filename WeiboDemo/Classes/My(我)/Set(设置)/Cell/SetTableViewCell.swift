//
//  SetTableViewCell.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/4/19.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit

enum SetCellStyle {
    case arrow /**<右边箭头 */
    case textAndArrow //右边箭头加文字
    case onOFF //开关
    case newText //新内容
}

class SetTableViewCell: UITableViewCell {

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
    
    // MARK: - 更新cell
    public func updateCell(_ title: String, _ style: SetCellStyle) {
        self.titleLabel.text = title
        switch style {
            case .arrow:
                self.rightTextLabel.isHidden = true
                self.setSwitch.isHidden = true
                self.newImage.isHidden = true
                self.rightArrow.isHidden = false
            case .textAndArrow:
                self.rightArrow.isHidden = true
                self.setSwitch.isHidden = true
                self.newImage.isHidden = true
                self.rightTextLabel.isHidden = false
            case .onOFF:
                self.rightArrow.isHidden = true
                self.rightTextLabel.isHidden = true
                self.newImage.isHidden = true
                self.setSwitch.isHidden = false
            case .newText:
                self.rightArrow.isHidden = true
                self.rightTextLabel.isHidden = true
                self.setSwitch.isHidden = true
                self.newImage.isHidden = false
        }
    }
    
    // MARK: - Action
    @objc private func switchAction(_ swi: UISwitch) {
        print("isOn = \(swi.isOn)")
    }
    
    // MARK: - 初始化view
    private func addView() {
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.rightArrow)
        self.contentView.addSubview(self.rightTextLabel)
        self.contentView.addSubview(self.newImage)
        self.contentView.addSubview(self.setSwitch)
        self.contentView.addSubview(self.lineView)
        
        self.makeUpdateConstraint()
    }
    
    // MARK: - 添加约束
    private func makeUpdateConstraint() {
        self.titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 1_000), for: UILayoutConstraintAxis.horizontal)
        self.titleLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.right.equalTo(self.rightTextLabel.snp.left).offset(-10)
        }
        
        self.rightArrow.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(36)
        }
        
        self.rightTextLabel.snp.makeConstraints { make in
            make.right.equalTo(self.rightArrow.snp.left).offset(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.left.equalTo(self.titleLabel.snp.right).offset(10)
        }
        
        self.newImage.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(36)
        }
        
        self.setSwitch.snp.makeConstraints { make in
            make.right.equalTo(-10)
            make.top.equalTo(4)
            make.bottom.equalTo(-4)
            make.width.equalTo(60)
        }
        
        self.lineView.snp.makeConstraints { make in
            make.bottom.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(0.5)
        }
    }
    
    // MARK: - 懒加载
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 16)
        return title
    }()
    
    private lazy var rightArrow: UIImageView = {
        let right = UIImageView(image: #imageLiteral(resourceName: "tab_home_highlighted"))
        return right
    }()
    
    private lazy var rightTextLabel: UILabel = {
        let rightText = UILabel()
        rightText.font = UIFont.systemFont(ofSize: 13)
        return rightText
    }()
    
    private lazy var newImage: UIImageView = {
        let new = UIImageView(image: #imageLiteral(resourceName: "tab_profile_highlighted"))
        return new
    }()
    
    private lazy var setSwitch: UISwitch = {
        let onOff = UISwitch()
        onOff.addTarget(self, action: #selector(switchAction(_:)), for: UIControlEvents.touchUpInside)
        return onOff
    }()
    
    private lazy var lineView: UIView = {
        let line = UIView()
        line.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        return line
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
