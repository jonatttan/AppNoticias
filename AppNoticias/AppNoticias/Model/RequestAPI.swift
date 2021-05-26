//
//  RequestAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit
import Alamofire

class RequestAPI {
    
    func request(_ categoria: CategoryNews = .CIENCIA, completionHandler: @escaping([Article]) -> Void) { // queue: DispatchQueue = .main,
        let endereco = "\(DataRequest.firstEnd)\(categoria.rawValue)\(DataRequest.page)\(DataRequest.pag)\(DataRequest.linguagePt)\(DataRequest.apiKey)"
        AF.request(endereco, method: .get).responseJSON { (response) in
            guard let dadosResposta = response.data else { return }
            do {
                let dadosRecebidos = try JSONDecoder().decode(News.self, from: dadosResposta)
                completionHandler(dadosRecebidos.articles)
            } catch {
                guard let status = response.response?.statusCode else { return }
                print("Erro \(status)")
                // Fazer um enum de errors para retornar (429: Sem mais noticias)
            }
        }
        DataRequest.pag += 1
    }
}
