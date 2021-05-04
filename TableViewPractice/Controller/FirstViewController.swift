//
//  FirstViewController.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/03.
//

import UIKit

final class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func autolayoutButton(_ sender: Any) {
        guard let autoLayout = UIStoryboard(name: "AutoLayoutTableView", bundle: nil).instantiateInitialViewController() else { return }
        self.present(autoLayout, animated: true, completion: nil)
    }
    
    @IBAction func setRowHeightButton(_ sender: Any) {
        guard let setRowHeight = UIStoryboard(name: "SetRowHeight", bundle: nil).instantiateInitialViewController() else { return }
        self.present(setRowHeight, animated: true, completion: nil)
    }
    
}
