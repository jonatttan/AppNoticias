//
//  RequestAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit
import Alamofire

class RequestAPI {
    let endereco = "\(DadosRequest.firstEnd)\(DadosRequest.page)\(DadosRequest.pag)\(DadosRequest.linguagePt)\(DadosRequest.apiKey)"
    func request(completionHandler: @escaping([Article]) -> Void) { // queue: DispatchQueue = .main,
        AF.request(endereco, method: .get).responseJSON { (response) in
            guard let dadosResposta = response.data else { return }
            do {
                let dadosRecebidos = try JSONDecoder().decode(News.self, from: dadosResposta)
                completionHandler(dadosRecebidos.articles)
            } catch {
                guard let status = response.response?.statusCode else { return }
                print("Erro \(status)")
                // Fazer um enum de errors para retornar
            }
        }
        DadosRequest.pag += 1
    }
}
