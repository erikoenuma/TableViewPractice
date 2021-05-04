//
//  URLRequest.swift
//  TableViewPractice
//
//  Created by 肥沼英里 on 2021/05/03.
//

import Foundation
import UIKit

final class QiitaAPIModel{
    
    private init(){}
    
    static func requestArticle(completion: @escaping([Article])->Void){
        guard let url = URL(string: "https://qiita.com/api/v2/tags/Swift/items") else { return }
        let task: URLSessionTask = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do{
                let article = try JSONDecoder().decode([Article].self, from: data)
                DispatchQueue.main.async {
                    completion(article)
                }
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    static func getImageByUrl(url: String)->UIImage{
        guard let url = URL(string: url) else { return UIImage()}
        do{
            let data = try Data(contentsOf: url)
            guard let image = UIImage(data: data) else { return UIImage()}
            return image
        }catch{
            print(error)
        }
        return UIImage()
    }
}
