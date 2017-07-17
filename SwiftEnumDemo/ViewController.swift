//
//  ViewController.swift
//  SwiftEnumDemo
//
//  Created by Maynard on 2017/7/17.
//  Copyright © 2017年 赤子城. All rights reserved.
//

import UIKit

protocol BaseCellInfo {
    var title: String { get }
    var content: String { get }
    var imageName: String { get }
}

enum SetContent: BaseCellInfo {
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
    var imageName: String {
        switch self {
        case .healthData:
            return "set_healthData"
        case .unit:
            return "set_unit"
        case .language:
            return "set_language"
        case .introduce:
            return "set_instructions"
        case .mode:
            return "set_workout_mode"
        case .share:
            return "set_share"
        case .feedback:
            return "set_feedback"
        case .about:
            return "set_about"
        case .score:
            return "set_rateus"
        }
    }
    
    var segueID: String {
        switch self {
        case .healthData:
            return "healthDataVC"
        case .unit:
            return "unitVC"
        case .language:
            return "languageVC"
        case .introduce:
            return "introduceVC"
        case .mode:
            return "modeVC"
        case .share:
            return "shareVC"
        case .feedback:
            return "feedbackVC"
        case .about:
            return "aboutVC"
        case .score:
            return "scoreVC"
        }
    }
    
    func showDetailVC(originalVC: UIViewController) {
        originalVC.performSegue(withIdentifier: segueID, sender: nil)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataArray: [[SetContent]] = [[.healthData, .unit, .language, .introduce],
                                     [.mode],
                                     [.share, .feedback, .about, .score]]
    
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
        cell.configureCell(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = dataArray[indexPath.section][indexPath.row]
        model.showDetailVC(originalVC: self)
    }
}
