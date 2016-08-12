//
//  NewsCell.swift
//  网易新闻
//
//  Created by wl on 15/11/14.
//  Copyright © 2015年 wl. All rights reserved.
//  一个基类

import UIKit
import SDWebImage

class NewsCell: UITableViewCell {
    
    var newsModel: NewsModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com