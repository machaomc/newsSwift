//
//  NewsDetailModels.swift
//  网易新闻
//
//  Created by wl on 15/11/22.
//  Copyright © 2015年 wl. All rights reserved.
//  一些新闻详情的数据模型
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
//========================================================
// 加入数据存储后，代码变得更加恶心，如果你有更好的办法一定要联系我
// 感激不尽！
//========================================================
import Foundation
import SwiftyJSON

//========================================================
// MARK: 新闻详情所用模型
//========================================================
/**
*  新闻详情页面中，某一张图片的模型
*/
class NewsDetailImgModel: NSObject, NSCoding, NewsModelInitProtocol{
    /// 图片的位置
    var ref: String
    /// 图片大小
    var pixel: String
    /// 图片的描述信息
    var alt: String
    /// 图片位置
    var src: String
    
    required init(json: JSON) {
        ref = json["ref"].stringValue
        pixel = json["pixel"].stringValue
        alt = json["alt"].stringValue
        src = json["src"].stringValue
    }
    
    required init?(coder decoder: NSCoder) {
        ref = decoder.decodeObjectForKey("ref") as! String
        pixel = decoder.decodeObjectForKey("pixel") as! String
        alt = decoder.decodeObjectForKey("alt") as! String
        src = decoder.decodeObjectForKey("src") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(ref, forKey: "ref")
        aCoder.encodeObject(pixel, forKey: "pixel")
        aCoder.encodeObject(alt, forKey: "alt")
        aCoder.encodeObject(src, forKey: "src")
    }
}
/**
*  新闻详情模型
*/
class NewsDetailModel: NSObject, NSCoding {
    /// 新闻标题
    var title: String
    /// 新闻发布时间
    var ptime: String
    /// 新闻内容
    var body: String
    /// 新闻详情的图片模型
    var img: [NewsDetailImgModel]
    /// 跟帖请求要用到的
    var replyBoard: String
    /// 新闻id请求要用到的
    var docid: String
    
    init(json: JSON) {
        title = json["title"].stringValue
        ptime = json["ptime"].stringValue
        body = json["body"].stringValue
        img = ModelArrayProvider.arrayModel(NewsDetailImgModel.self, json: json["img"])!
        replyBoard = json["replyBoard"].stringValue
        docid = json["docid"].stringValue
    }
    
    required init?(coder decoder: NSCoder) {
        title = decoder.decodeObjectForKey("title") as! String
        ptime = decoder.decodeObjectForKey("ptime") as! String
        body = decoder.decodeObjectForKey("body") as! String
        img = decoder.decodeObjectForKey("img") as! [NewsDetailImgModel]
        replyBoard = decoder.decodeObjectForKey("replyBoard") as! String
        docid = decoder.decodeObjectForKey("docid") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(ptime, forKey: "ptime")
        aCoder.encodeObject(body, forKey: "body")
        aCoder.encodeObject(img, forKey: "img")
        aCoder.encodeObject(replyBoard, forKey: "replyBoard")
        aCoder.encodeObject(docid, forKey: "docid")
    }
    
}
//========================================================
// MARK: 专题新闻所用模型
//========================================================
/**
*  专题内的子话题模型
*/
class Topic: NSObject, NSCoding, NewsModelInitProtocol{
    /// 话题名
    var tname: String
    /// 索引
    var index: Int
    /// 话题内的新闻
    var docs: [NewsModel]
    
    required init(json: JSON) {
        tname = json["tname"].stringValue
        index = json["index"].intValue
        docs = ModelArrayProvider.arrayModel(NewsModel.self, json: json["docs"])!
    }
    
    required init?(coder decoder: NSCoder) {
        tname = decoder.decodeObjectForKey("tname") as! String
        index = decoder.decodeObjectForKey("index") as! Int
        docs = decoder.decodeObjectForKey("docs") as! [NewsModel]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(tname, forKey: "tname")
        aCoder.encodeObject(index, forKey: "index")
        aCoder.encodeObject(docs, forKey: "docs")
    }
}
/**
*  专题新闻模型
*/
class NewsSpecialModel: NSObject, NSCoding {
    /// 新闻专题名
    var sname: String
    /// 发布时间
    var ptime: String
    /// 图片
    var banner: String
    /// 子话题
    var topics: [Topic]
    
    init(json: JSON) {
        sname = json["sname"].stringValue
        ptime = json["ptime"].stringValue
        banner = json["banner"].stringValue
        topics = ModelArrayProvider.arrayModel(Topic.self, json: json["topics"])!
    }
    
    required init?(coder decoder: NSCoder) {
        sname = decoder.decodeObjectForKey("sname") as! String
        ptime = decoder.decodeObjectForKey("ptime") as! String
        banner = decoder.decodeObjectForKey("banner") as! String
        topics = decoder.decodeObjectForKey("topics") as! [Topic]
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(sname, forKey: "sname")
        aCoder.encodeObject(ptime, forKey: "ptime")
        aCoder.encodeObject(banner, forKey: "banner")
        aCoder.encodeObject(topics, forKey: "topics")
    }
}

//========================================================
// MARK: 图片新闻所用模型
//========================================================
/**
*  图片新闻的图片模型
*/
class Photo: NSObject, NSCoding, NewsModelInitProtocol{
    /// 描述
    var note: String
    var imgurl: String
    
    required init(json: JSON) {
        note = json["note"].stringValue
        imgurl = json["imgurl"].stringValue
    }
    
    required init?(coder decoder: NSCoder) {
        note = decoder.decodeObjectForKey("note") as! String
        imgurl = decoder.decodeObjectForKey("imgurl") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(note, forKey: "note")
        aCoder.encodeObject(imgurl, forKey: "imgurl")
    }
}
/**
*  图片新闻的模型
*/
class NewsPictureModel: NSObject, NSCoding {
    /// 图片新闻内容
    var photos: [Photo]
    /// 名称
    var setname: String
    /// 数量
    var imgsum: Int
    /// 跟帖请求要用到的
    var boardid: String
    /// 新闻id请求要用到的
    var postid: String
    
    init(json: JSON) {
        setname = json["setname"].stringValue
        imgsum = json["imgsum"].intValue
        photos = ModelArrayProvider.arrayModel(Photo.self, json: json["photos"])!
        boardid = json["boardid"].stringValue
        postid = json["postid"].stringValue
    }
    
    required init?(coder decoder: NSCoder) {
        setname = decoder.decodeObjectForKey("setname") as! String
        imgsum = decoder.decodeObjectForKey("imgsum") as! Int
        photos = decoder.decodeObjectForKey("photos") as! [Photo]
        boardid = decoder.decodeObjectForKey("boardid") as! String
        postid = decoder.decodeObjectForKey("postid") as! String
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(setname, forKey: "setname")
        aCoder.encodeObject(imgsum, forKey: "imgsum")
        aCoder.encodeObject(photos, forKey: "photos")
        aCoder.encodeObject(boardid, forKey: "boardid")
        aCoder.encodeObject(postid, forKey: "postid")
    }
    
}

//========================================================
// MARK: 新闻评论所用模型
//========================================================
/**
 * 一条评论内容的模型
 */
class ReplyModel {
 /// 用户名
    var name: String
 /// 用户的地址信息
    var userAddress: String
 /// 用户发言
    var message: String
 /// 赞，楼主才有
    var suppose: String?
    /// 头像
    var timg: String?
 /// 这条评论的楼数
    var floor: Int
    init(key: String, json: JSON) {
        
        floor = (key as NSString).integerValue
        name = json["n"].string ?? "火星网友"
        userAddress = json["f"].stringValue
        message = json["b"].stringValue
        suppose = json["v"].string
        timg = json["timg"].string
    }
}



// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com