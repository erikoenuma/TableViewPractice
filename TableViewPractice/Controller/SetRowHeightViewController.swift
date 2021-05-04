//
//  SetRowHeightViewController.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/03.
//

import UIKit

final class SetRowHeightViewController: UIViewController, UITableViewDelegate {
    
    private let cellClassName = "TableViewCell"
    private let reuseId = "TableViewCell"
    private var articles: [Article] = []
    private var heightCache: [IndexPath:CGFloat] = [:]

    @IBOutlet private weak var tableView: UITableView!{
        didSet{
            let cellNib = UINib(nibName: cellClassName, bundle: nil)
            tableView.register(cellNib, forCellReuseIdentifier: reuseId)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getArticles()
//        //実際の高さとあまりにも乖離していると読み込みが遅くなる
//        tableView.estimatedRowHeight = 90
        
//        //セルの高さを固定する
//        tableView.rowHeight = 500
        
    }
    
    private func getArticles(){
        QiitaAPIModel.requestArticle { result in
            self.articles = result
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    //セルごとに高さを計算する
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //キャッシュがある場合はキャッシュを使用
        if let cache = heightCache[indexPath]{
            return cache
        }
        //キャッシュがない場合は高さを取得
        //高さを自動取得
        let height = UITableView.automaticDimension
//        //自分で計算する場合
//        let height = TableViewCell().cellHeight(articleModel: articles[indexPath.row])
        return height
    }
    
    //セルの高さをキャッシュする
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        heightCache[indexPath] = cell.frame.height
    }
}

extension SetRowHeightViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        //セルを初期化
        //prepareForReuse内にはセルの内容に関する初期化処理は書かない（公式ドキュメントより）
        cell.initValue()
        cell.configure(articleModel: articles[indexPath.row])
//        cell.iconImageView.isHidden = false
//        //セルを再利用しているので↓を実行すると再利用されたセルの画像もHiddenになる
//        if indexPath.row == 3{
//            cell.configure(name: "あああ", text: "3番目のセルです")
//            cell.iconImageView.isHidden = true
//        }
        return cell
    }
}
