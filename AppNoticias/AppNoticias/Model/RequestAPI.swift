//
//  RequestAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit
import Alamofire

class RequestAPI {
    var pagina = 1
    let category: CategoryNews
    
    init(_ category: CategoryNews) {
        self.category = category
    } 
    func request(completionHandler: @escaping([ArticleModel]) -> Void) {
        let endereco = "\(DataRequest.firstEnd)\(self.category.rawValue)\(DataRequest.page)\(self.pagina)\(DataRequest.linguagePt)\(DataRequest.apiKey)"
        if pagina < 6 {
            AF.request(endereco, method: .get).responseJSON { (response) in
                guard let dadosResposta = response.data else { return }
                do {
                    let dadosRecebidos = try JSONDecoder().decode(NewsModel.self, from: dadosResposta)
                    completionHandler(dadosRecebidos.articles)
                } catch {
                    guard let status = response.response?.statusCode else { return }
                    print("Erro \(status)")
                    // Fazer um enum de errors para retornar (429: Sem mais noticias)
                }
            }
            self.pagina += 1
        }
    }
}
