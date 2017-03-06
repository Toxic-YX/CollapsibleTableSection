//
//  ViewController.swift
//  Swift-CollapsibleTableSection
//
//  Created by YuXiang on 2017/3/6.
//  Copyright © 2017年 Rookie.YXiang. All rights reserved.
//

import UIKit
// 注意: storyboard中的tableView要设置么有下划线  , 不然会出现一点小 Bug
// 数据模型 swift中我们可以使用结构体来自定义数据模型, 不要在繁琐的建个类了
struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}

fileprivate let cellID:String = "cellID"
fileprivate let cellHearderID:String = "cellHearderID"

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sections = [Section]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
      config()
    }

  fileprivate func config() {
    title = "CollapsibleTableSection"
    sections = [
    Section(name: "老师", items: ["李老师","张老师","昂老师"]),
    Section(name: "同事", items: ["小红","小明","小刚"]),
    Section(name: "同学", items: ["藏小可","李小白","李梓萌","栗子","大力"])
    ]
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
  }
}

extension ViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].items.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
    return cell
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }
}

extension ViewController : UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 44.0
  }
  
 func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 1.0
  }

  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return sections[indexPath.section].collapsed! ? 0 : 44.0
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? ColapsibleTableHeaderFooterView ?? ColapsibleTableHeaderFooterView(reuseIdentifier: "header")
    
    header.titleLabel.text = sections[section].name
    header.arrowLabel.text = ">"
    header.setCollapsed(collapsed: sections[section].collapsed)
    
    header.section = section
    header.delegate = self
    return header
  }

}

extension ViewController : ColapsibleTableHeaderFooterViewDelegate {
  func toggleSection(header: ColapsibleTableHeaderFooterView, section: Int) {
    let collapsed = !sections[section].collapsed
    
    sections[section].collapsed = collapsed
    header.setCollapsed(collapsed: collapsed)
   
    tableView.beginUpdates()
    for i in 0 ..< sections[section].items.count {
     
      tableView.reloadRows(at: [ NSIndexPath(row: i, section: section) as IndexPath], with: .automatic)
    }
    tableView.endUpdates()
  }
}
