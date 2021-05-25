//
//  RecoverKey.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 25/05/21.
//

import Foundation

class RecoverKey: NSObject {
    
    func caminho() -> NSDictionary? {
        guard let pathToDictionary = Bundle.main.path(forResource: "Info", ofType: ".plist")
            else { return nil }
        guard let dictionary = NSDictionary(contentsOfFile: pathToDictionary) else { return nil }
        return dictionary
    }
    func recKey() -> String {
        guard let dictionary = caminho() else { return "" }
        guard let key = dictionary["ApiKey"] as? String else { return "" }
        return key
    }
}
