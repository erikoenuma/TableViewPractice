//
//  QiitaItems.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/03.
//

import Foundation

struct Article: Codable{
    var title: String
    var url: String
    var user: User
}

struct User: Codable{
    var id: String
    var profileImageUrl: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case profileImageUrl = "profile_image_url"
    }
}
