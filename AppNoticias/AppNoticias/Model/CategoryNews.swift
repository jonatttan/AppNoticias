//
//  CategoryNews.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 26/05/21.
//

import Foundation


enum CategoryNews: String, CodingKey {
    case ESPORTE = "q=esporte",
         CIENCIA = "q=ciencia",
         TECNOLOGIA = "q=tecnologia",
         TURISMO = "q=turismo"
}
