//
//  RequestAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit
import Alamofire

class RequestAPI {
    var currentPage = 1
    var requestAgayn = true
    let category: CategoryNews
    
    init(_ category: CategoryNews) {
        self.category = category
    } 
    func request(completionHandler: @escaping([ArticleModel]) -> Void) {
        let endereco = "\(DataRequest.firstEnd)\(self.category.rawValue)\(DataRequest.page)\(self.currentPage)\(DataRequest.linguagePt)\(DataRequest.apiKey)"
        if requestAgayn {
            AF.request(endereco, method: .get).responseJSON { (response) in
                guard let dadosResposta = response.data else { return }
                guard let status = response.response?.statusCode else { return }
                do {
                    let dataReceived = try JSONDecoder().decode(NewsModel.self, from: dadosResposta)
                    completionHandler(dataReceived.articles)
                    self.currentPage += 1
                } catch {
                    self.requestAgayn = false
                    print("--Status: ", status)
                    // Fazer um enum de errors para retornar (429: Sem mais noticias)
                }
            }
        }
    }
}
