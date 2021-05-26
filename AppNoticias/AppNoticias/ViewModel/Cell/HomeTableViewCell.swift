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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setValues(_ dataString: String) {
        let data = CategoryData().getData(dataString)
        guard let img = URL(string: data[1]) else { return }
        self.imgPoster.af.setImage(withURL: img)
//        self.imgPoster.layer.cornerRadius = 10
//        self.imgPoster.layer.shadowColor = UIColor.red.cgColor
//        self.imgPoster.layer.opacity = 1
//        self.imgPoster.layer.shadowOffset = .zero
//        self.imgPoster.layer.shadowRadius = 10
        self.lbTitleCategory.text = data.first
    }
}
