//
//  StructAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import Foundation

public struct News: Codable {
//    let status: String
//    let totalResults: Int
    
    let articles: [Article]
//    enum CodingKeys: String, CodingKey {
//        case articles
//    }
}

struct Article: Codable {
//    let source: Source
    let author: String
    let title: String
//        description: String
    let url: String
    let urlToImage: String
//    let publishedAt: Date
//    let content: String
}

//struct Source: Codable {
//    let id: String?
//    let name: String
//}

struct DadosRequest {
    public static let firstEnd = "https://newsapi.org/v2/everything?q=tecnologia"
    public static let apiKey = RecoverKey().recKey()
}
