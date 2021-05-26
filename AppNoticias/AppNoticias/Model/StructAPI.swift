//
//  StructAPI.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import Foundation

public struct News: Codable {
    
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let url: String
    let urlToImage: String
}


struct DataRequest {
    public static let firstEnd = "https://newsapi.org/v2/everything?"
    public static let linguagePt = "&language=pt"
    public static let pageSize = "&pageSize=50"
    public static let page = "&page="
    public static var pag = 1
    public static let apiKey = RecoverKey().recKey()
}
