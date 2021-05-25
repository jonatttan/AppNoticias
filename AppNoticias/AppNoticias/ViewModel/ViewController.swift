//
//  ViewController.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource { //  UITableViewDelegate,
    
    @IBOutlet weak var tbView: UITableView!
    var artigos: [Article] = []
    
    override func viewWillAppear(_ animated: Bool) {
        recuperaArtigos()
    }
    func recuperaArtigos() {
        RequestAPI().request { (artigos) in
            self.artigos = artigos
            print(artigos.count)
            self.tbView.reloadData()
        }
    }
}
extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(artigos.count)
        return artigos.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news-cell", for: indexPath) as? LayoutTableViewCell
        if let celula = cell {
            return celula
        }
        return LayoutTableViewCell()
    }
}

