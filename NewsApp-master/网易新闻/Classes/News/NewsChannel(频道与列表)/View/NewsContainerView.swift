//
//  NewsContainerView.swift
//  网易新闻
//
//  Created by wl on 15/11/13.
//  Copyright © 2015年 wl. All rights reserved.
//  这个类原本打算用来循环利用，但是实际作用并不大()
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
import UIKit

// TODO: 删除此类
class NewsContainerView: UIScrollView, CycleCacheProtocol {
    var buffer: [Int : UIView] = [:]
    var maxBufferCount: Int = 3
    
}

/**
*  缓存协议，用来优化scrollView的显示
*/
protocol CycleCacheProtocol {
    /// 存储所有可能显示的view
    var buffer: [Int : UIView] {get set}
    /// 缓存的数量(包括正在显示的view)
    var maxBufferCount: Int {get set}
    
    mutating func showViewInScrollView(showView: UIView, showViewIndex: Int)
    
}

extension CycleCacheProtocol where Self : UIScrollView {

    
    mutating func showViewInScrollView(showView: UIView, showViewIndex: Int) {

        showView.frame = self.bounds

        self.buffer[showViewIndex] = showView
        // 先移除所有的view，还有优化的空间
        for (_, view) in buffer {
            view.removeFromSuperview()
        }
        
        // 将缓存的view添加到视图
        let cacheCount = (self.maxBufferCount - 1) / 2
        print("cacheCount",cacheCount,"buffer.count",self.buffer.count)
        for var i = showViewIndex - cacheCount; i <= showViewIndex + cacheCount; i++ {
            print(i)
            if let view = buffer[i] {
                print("添加",i)
                self.addSubview(view)
            }
        }
 
    }
}

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com