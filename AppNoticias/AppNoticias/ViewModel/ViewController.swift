//
//  ViewController.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbView: UITableView!
    var artigos: [Article] = []
    
    override func viewWillAppear(_ animated: Bool) {
        recuperaArtigos()
    }
    func recuperaArtigos() {
        RequestAPI().request { (artigos) in
            self.artigos = artigos
            self.tbView.reloadData()
        }
    }
}
extension ViewController {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artigos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "news-cell", for: indexPath) as? LayoutTableViewCell
        if let celula = cell {
            celula.configCell(artigos[indexPath.row])
            return celula
        }
        return LayoutTableViewCell()
    }
}

