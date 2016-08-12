//
//  SecondLaunchView.swift
//  网易新闻
//
//  Created by wl on 15/11/11.
//  Copyright © 2015年 wl. All rights reserved.
//  第二启动页面，使用xib
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
import UIKit

class SecondLaunchView: UIView {

    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func showAtWindow(image: String?) {
        
        guard let imageStr = image  else {
            return
        }
        
        let secondLaunchView = NSBundle.mainBundle().loadNibNamed("SecondLaunchView", owner: self, options: nil).first as! SecondLaunchView

        let window = UIApplication.sharedApplication().keyWindow
        secondLaunchView.frame = window!.bounds
        window?.addSubview(secondLaunchView)
        
        secondLaunchView.imageView.sd_setImageWithURL(NSURL(string: imageStr)!)
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * NSEC_PER_SEC)), dispatch_get_main_queue()) { () -> Void in
            secondLaunchView.removeFromSuperview()
        }
    }
    
    deinit {
//        print("SecondLaunchView--deinit")
    }
    
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com