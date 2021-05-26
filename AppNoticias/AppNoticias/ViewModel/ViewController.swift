//
//  ViewController.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 24/05/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tbView: UITableView!
    var request: RequestAPI?
    var artigos: [ArticleModel] = []
    var loading = false
    var titleWindow = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.titleWindow
        recuperaArtigos()
        let loadCell = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        self.tbView.register(loadCell, forCellReuseIdentifier: "loading-cell")
    }
    func recuperaArtigos() {
        guard let objRequest = self.request else { return }
        objRequest.request { (artigos) in
            self.artigos += artigos
            self.tbView.reloadData()
        }
    }
}
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return artigos.count
        }
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "news-cell", for: indexPath) as? LayoutTableViewCell
            if let celula = cell {
                celula.configCell(artigos[indexPath.row])
                return celula
            }
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "loading-cell", for: indexPath) as? LoadingTableViewCell
        if let celula = cell {
            celula.activityIndicator.startAnimating()
            return celula
        }
        
        return LayoutTableViewCell()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offY = scrollView.contentOffset.y
        let contHeight = scrollView.contentSize.height
        let gatilho = contHeight - scrollView.frame.height - 40
        if (offY > gatilho) && !loading {
            loadMore()
        }
    }
    func loadMore() {
        if !self.loading {
            self.loading = true
            DispatchQueue.global().async {
                sleep(1)
                self.recuperaArtigos()
                self.loading = false
            }
        }
    }
}

