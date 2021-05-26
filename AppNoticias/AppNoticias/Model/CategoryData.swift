//
//  CategoryData.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 26/05/21.
//

import Foundation

public class CategoryData: NSObject {
    let img = [
        CategoryNews.ESPORTE.rawValue: ["Esporte", "https://itaitinga.ce.gov.br/fotos/205/Img0_600x400.jpg"],
        CategoryNews.CIENCIA.rawValue: ["Ciência", "https://i0.wp.com/cartacampinas.com.br/wordpress/wp-content/uploads/laboratorio-ebc-ag-brasil-pesquisa-ciencia-tecnologia.jpg?resize=600%2C400"],
        CategoryNews.TECNOLOGIA.rawValue: ["Tecnologia", "https://midias.agazeta.com.br/2020/09/21/tecnologias-da-informacao-323406-article.jpg"],
        CategoryNews.TURISMO.rawValue: ["Turismo", "https://uploads.metropoles.com/wp-content/uploads/2020/09/25140536/Viagem-16-600x400.jpg"]
    ]
    let listCategory: [CategoryNews] = [.TECNOLOGIA, .CIENCIA, .ESPORTE, .TURISMO]
    
    func getData(_ category: String) -> [String] {
        return img[category] ?? ["",""]
    }
    func getListCategory() -> [CategoryNews] {
        return listCategory
    }
}
