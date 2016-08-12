//
//  CitySelectController.swift
//  网易新闻
//
//  Created by wl on 15/11/24.
//  Copyright © 2015年 wl. All rights reserved.
//  选择城市的控制器
/***************************************************
*  如果您发现任何BUG,或者有更好的建议或者意见，请您的指教。
*邮箱:wxl19950606@163.com.感谢您的支持
***************************************************/
import UIKit

protocol CitySelectControllerDelegate: class{
    func didSelectCity(citymodel: CityModel)
}

class CitySelectController: UITableViewController {
    
    var cityBox: CityBox = CityBox()
    weak var delegate: CitySelectControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return self.cityBox.cityGroup.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cityType = self.cityBox.cityGroup[section]
        return cityType.cities.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let cityType = self.cityBox.cityGroup[section]
        return cityType.type
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("city")
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "city")
        }
        
        let cityModel = self.cityBox[indexPath]
        cell!.textLabel?.text = cityModel.cityName
        return cell!
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let cityModel = self.cityBox[indexPath]
        self.dismissViewControllerAnimated(false, completion: nil)
        self.delegate?.didSelectCity(cityModel)
    }
    
    deinit {
//        print("CitySelectController==deinit")
    }
}
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com