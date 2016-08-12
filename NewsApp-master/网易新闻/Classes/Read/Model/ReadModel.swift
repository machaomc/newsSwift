//
//  ReadModel.swift
//  网易新闻
//
//  Created by wl on 15/12/27.
//  Copyright © 2015年 wl. All rights reserved.
//  阅读模块模型
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
import Foundation
import SwiftyJSON
/**
 *  阅读新闻模型，
 */
class ReadNewsModel: NewsModel {
 /// 新闻来源
    var source: String
 /// 推荐标签(猜您喜欢)
    var recReason: String?
    /// 用于判断新闻的种类
    var template: String
    required init(json: JSON) {
        source = json["source"].stringValue
        recReason = json["recReason"].string
        template = json["template"].stringValue
        super.init(json: json)
        imgextra = ModelArrayProvider.arrayWithJson(json["imgnewextra"])
        judgeCellType()
    }
    

    required init(coder decoder: NSCoder) {
        source = decoder.decodeObjectForKey("source") as! String
        recReason = decoder.decodeObjectForKey("recReason") as? String
        template = decoder.decodeObjectForKey("template") as! String
        super.init(coder: decoder)
    }
    
    override func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(source, forKey: "source")
        aCoder.encodeObject(recReason, forKey: "recReason")
        aCoder.encodeObject(template, forKey: "template")
        super.encodeWithCoder(aCoder)
    }

}
extension ReadNewsModel {
    override func judgeCellType() {
        if self.template == "pic1" {
            self.cellType = .ReadBigPictureCell
        }else if self.imgextra != nil {
            self.cellType = .ReadThreePictureCell
        }else {
            self.cellType = .ReadNormalNewsCell
        }
    }
}




// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com