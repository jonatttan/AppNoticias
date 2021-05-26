//
//  HomeTableViewCell.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 26/05/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lbTitleCategory: UILabel!
    
    func setValues(_ dataString: String) {
        let data = CategoryData().getData(dataString)
        guard let img = URL(string: data[1]) else { return }
        self.imgPoster.af.setImage(withURL: img)
        self.lbTitleCategory.text = data.first
    }
}
