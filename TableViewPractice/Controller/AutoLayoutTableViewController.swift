//
//  AutoLayoutTableViewController.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/02.
//

import UIKit

final class AutoLayoutTableViewController: UIViewController {

    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    private let text = "365連休ほしい。5億円ほしい。埋蔵金を見つけたい。石油王の36番目の嫁になりたい。"
    
    @IBOutlet private weak var tableView: UITableView!{
        didSet{
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension AutoLayoutTableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        let name = "ユーザー\(indexPath.row+1)"
        let mainText = String(repeating: text, count: indexPath.row+1)
        cell.configure(name: name, text: mainText)
        return cell
    }
}
