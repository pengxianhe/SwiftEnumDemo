//
//  ViewController.swift
//  SwiftEnumDemo
//
//  Created by Maynard on 2017/7/17.
//  Copyright © 2017年 赤子城. All rights reserved.
//

import UIKit

struct SetContent {
    let title: String
    let content: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [[SetContent]] = [[SetContent(title: "健康数据", content: "1"),
                                      SetContent(title: "公英制", content: "2"),
                                      SetContent(title: "语言选择", content: "3"),
                                      SetContent(title: "介绍说明", content: "4")],
                                 [SetContent(title: "训练模式", content: "5")],
                                 [SetContent(title: "分享", content: "6"),
                                  SetContent(title: "意见反馈", content: "7"),
                                  SetContent(title: "关于", content: "8"),
                                  SetContent(title: "评分", content: "9")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCellTableViewCell") as! TitleCellTableViewCell
        let model = dataArray[indexPath.section][indexPath.row]
        cell.titleLabel.text = model.title
        cell.contentLabel.text = model.content
        return cell
    }
}
