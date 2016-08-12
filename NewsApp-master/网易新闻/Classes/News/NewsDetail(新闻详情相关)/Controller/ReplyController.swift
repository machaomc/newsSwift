//
//  ReplyController.swift
//  网易新闻
//
//  Created by wl on 15/12/5.
//  Copyright © 2015年 wl. All rights reserved.
//  显示跟帖的控制器
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
import UIKit

// TODO: 子评论没有做
class ReplyController: UIViewController {
    var replyBoard: String!
    var requestID: String!
    
    var hotReplyArray: [[ReplyModel]]?
    var newReplyArray: [[ReplyModel]]?
    
    let replyCellProvider = ReplyCellProvider()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.hidden = true
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.tableView.delegate = self.replyCellProvider
        self.tableView.dataSource = self.replyCellProvider
        self.replyCellProvider.tableView = self.tableView
        
        self.tableView.registerNib(UINib(nibName: "ReplyCell", bundle: nil), forCellReuseIdentifier: "ReplyCell")
        let hotUrl = "http://comment.api.163.com/api/json/post/list/new/hot/\(replyBoard)/\(requestID)/0/10/10/2/2"
        let newUrl = "http://comment.api.163.com/api/json/post/list/new/normal/\(replyBoard)/\(requestID)/desc/0/10/10/2/2"

        DataTool.loadReplyData((hotUrl, newUrl)) { (hotResponse, newResponse) -> Void in
            guard let hotReplyArray = hotResponse, newReplyArray = newResponse else {
                return
            }
           
            self.hotReplyArray = hotReplyArray
            self.newReplyArray = newReplyArray
            self.replyCellProvider.hotReplyArray = hotReplyArray
            self.replyCellProvider.newReplyArray = newReplyArray
            self.tableView.hidden = false
            self.tableView.reloadData()
        }
    }
    
    @IBAction func backBtnClik() {
        self.navigationController?.popViewControllerAnimated(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    

}

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com