//
//  CustomTopSegment.swift
//  WeiboDemo
//
//  Created by 贺文杰 on 2018/5/8.
//  Copyright © 2018年 贺文杰. All rights reserved.
//

import UIKit
import SnapKit

enum iceCreamType {
    case strawberry //草莓
    case chocolate //巧克力
    case butter //奶油
    case matcha //抹茶
}

struct iceCream {
    var metrals : [iceCreamType]
}

extension iceCream{
    func addStrawberry(_ number:iceCream, _ strawberry : iceCreamType) -> iceCream{
        var metr = number.metrals
        metr.append(strawberry)
        return number
    }
}

typealias typeIceCream = (iceCream) -> iceCreamType
typealias iceCre = (iceCream) -> iceCream

//判断冰淇淋类型
func HWJIceCreamType() -> typeIceCream {
    return { iceType in iceType.metrals[0] }
}

//自定义顶部菜单栏
class CustomTopSegment: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    //MARK: - 初始化
    private func addView() {
        
    }
    
    //MARK: - 添加约束
    private func makeUpdateConstraint() {
        
    }

    //MARK: - 懒加载
    private lazy var scrollview : UIScrollView = {
        let scrView = UIScrollView()
        scrView.showsVerticalScrollIndicator = false
        scrView.showsHorizontalScrollIndicator = false
        return scrView
    }()

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
