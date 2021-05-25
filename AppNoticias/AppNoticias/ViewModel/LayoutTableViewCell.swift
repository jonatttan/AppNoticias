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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(_ artigo: Article) {
        guard let urlImage = URL(string: artigo.urlToImage) else { return }
        self.imgNoticia.af.setImage(withURL: urlImage)
        self.imgNoticia.layer.cornerRadius = 10
        self.lbTituloNoticia.text = artigo.title
    }
}
