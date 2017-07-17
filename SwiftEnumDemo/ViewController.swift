//
//  ViewController.swift
//  SwiftEnumDemo
//
//  Created by Maynard on 2017/7/17.
//  Copyright © 2017年 赤子城. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [[String]] = [["健康数据", "公英制", "语言选择", "介绍说明"],
                                 ["训练模式"],
                                 ["分享", "意见反馈", "关于", "评分"]]
    
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
        cell.titleLabel.text = dataArray[indexPath.section][indexPath.row]
        return cell
    }
}
