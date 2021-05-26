//
//  LayoutTableViewCell.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 25/05/21.
//

import UIKit
import Alamofire
import AlamofireImage
class LayoutTableViewCell: UITableViewCell {

    @IBOutlet weak var imgNoticia: UIImageView!
    @IBOutlet weak var lbTituloNoticia: UILabel!

    func configCell(_ artigo: ArticleModel) {
        guard let urlImage = URL(string: artigo.urlToImage) else { return }
        self.imgNoticia.af.setImage(withURL: urlImage)
        self.imgNoticia.layer.cornerRadius = 10
        self.lbTituloNoticia.text = artigo.title
    }
}
