//
//  ChannelLabel.swift
//  网易新闻
//
//  Created by wl on 15/11/13.
//  Copyright © 2015年 wl. All rights reserved.
//  自定义label，用于频道显示

import UIKit

class ChannelLabel: UILabel {

    var scale: CGFloat = 0.0 {
        didSet {
            self.textColor = UIColor(red: scale, green: 0, blue: 0, alpha: 1)
            let s: CGFloat = 1 + scale * CGFloat(0.3)
            self.transform = CGAffineTransformMakeScale(s, s)
        }
    }

}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com