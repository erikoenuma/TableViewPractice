//
//  TableViewCell.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/02.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell{

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var mainTextLabel: UILabel!
    
    func initValue(){
        iconImageView.image = nil
        nameLabel.text = nil
        mainTextLabel.text = nil
    }
    
    func configure(name: String, text: String){
        nameLabel.text = name
        mainTextLabel.text = text
    }
    
    func configure(articleModel: Article){
        nameLabel.text = articleModel.user.id
        mainTextLabel.text = articleModel.title
        iconImageView.image = QiitaAPIModel.getImageByUrl(url: articleModel.user.profileImageUrl)
    }
    
    func cellHeight(articleModel: Article) -> CGFloat{
        if articleModel.title.count >= 30{
            return 180
        }
        return 90
    }
}
