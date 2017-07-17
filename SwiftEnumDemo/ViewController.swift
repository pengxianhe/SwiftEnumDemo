//
//  ViewController.swift
//  SwiftEnumDemo
//
//  Created by Maynard on 2017/7/17.
//  Copyright © 2017年 赤子城. All rights reserved.
//

import UIKit

enum SetContent {
    case healthData
    case unit
    case language
    case introduce
    case mode
    case share
    case feedback
    case about
    case score
    
    var title: String {
        switch self {
        case .healthData:
            return "健康数据"
        case .unit:
            return "公英制"
        case .language:
            return "语言选择"
        case .introduce:
            return "介绍说明"
        case .mode:
            return "训练模式"
        case .share:
            return "分享"
        case .feedback:
            return "意见反馈"
        case .about:
            return "关于"
        case .score:
            return "评分"
        }
    }
    var content: String {
        switch self {
        case .healthData:
            return "1"
        case .unit:
            return "2"
        case .language:
            return "3"
        case .introduce:
            return "4"
        case .mode:
            return "5"
        case .share:
            return "6"
        case .feedback:
            return "7"
        case .about:
            return "8"
        case .score:
            return "9"
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [[SetContent]] = [[.healthData, .unit, .share, .language, .introduce],
                                     [.mode],
                                     [.feedback, .about, .score]]
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[indexPath.section][indexPath.row]
        switch model {
        case .healthData:
            performSegue(withIdentifier: "healthDataVC", sender: nil)
        case .unit:
            performSegue(withIdentifier: "unitVC", sender: nil)
        case .language:
            performSegue(withIdentifier: "languageVC", sender: nil)
        case .introduce:
            performSegue(withIdentifier: "introduceVC", sender: nil)
        case .mode:
            performSegue(withIdentifier: "modeVC", sender: nil)
        case .share:
            performSegue(withIdentifier: "shareVC", sender: nil)
        case .feedback:
            performSegue(withIdentifier: "feedbackVC", sender: nil)
        case .about:
            performSegue(withIdentifier: "aboutVC", sender: nil)
        case .score:
            performSegue(withIdentifier: "scoreVC", sender: nil)
        }
    }
}
