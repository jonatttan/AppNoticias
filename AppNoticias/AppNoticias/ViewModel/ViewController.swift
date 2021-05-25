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
    var loading = false // 1 cria esse loading, ele vai controlar pra não fazer mais que 1 reload por x
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let loadCell = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        self.tbView.register(loadCell, forCellReuseIdentifier: "loading-cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        recuperaArtigos()
    }
    func recuperaArtigos() {
        RequestAPI().request { (artigos) in
            self.artigos += artigos
            self.tbView.reloadData()
        }
    }
}
extension ViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2 // 2 terá de colocar mais um section para identificar o final do primeiro
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { // 3 terá que definir que o primeiro irá ter o numero de linhas do retorno API
            return artigos.count
        }
        return 1 // 4 Se o section não for o primeiro, este pode receber apenas 1 linha, mesmo
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 { // 5 define que as linhas da primeira section vai receber os dados até o limite de artigos e o seu
            let cell = tableView.dequeueReusableCell(withIdentifier: "news-cell", for: indexPath) as? LayoutTableViewCell
            if let celula = cell {
                celula.configCell(artigos[indexPath.row])
                return celula
            }
        }
        // 6 Define que as linhas de sections que não forem 0 (no caso uma) vai receber loading, uma cell que criei pra mostrar o carregamento, mas pode apenas usar uma instancia do anterior.
        let cell = tableView.dequeueReusableCell(withIdentifier: "loading-cell", for: indexPath) as? LoadingTableViewCell
        if let celula = cell {
            celula.activityIndicator.startAnimating()
            return celula
        }
        
        return LayoutTableViewCell()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) { // 7 Terá de impeplementar essa função, vai ser acionada na movimentação do scroll
        let offY = scrollView.contentOffset.y
        let contHeight = scrollView.contentSize.height
        
        if (offY > contHeight - scrollView.frame.height - 40) && !loading {
            // 8 Aqui mora a verificação. NO TUTO vem * 4, porém, com esse valor, sempre passa pois dá negativo. Experimentei * 0.9 e ficou bom, mas decidi por - 40 Deixo os prints para verificar, comente o loadMore e substitua o - 40 por * 4.
            loadMore()
            print("Y: \(offY)")
            print("Height: \(contHeight - scrollView.frame.height - 40)")
            print("Opaaa página \(DadosRequest.pag) ---------------")
        }
    }
    func loadMore() { // 9 Aqui vai de fato executar a chamada da API, lembrando que após a chamada, pra dar certo, tive de incrementar o valor retornado na lista, não atribuir (listaObjetos += retorno).
        if !self.loading {
            self.loading = true
            DispatchQueue.global().async {
                //
                sleep(1)
                self.recuperaArtigos()
                self.loading = false
            }
        }
    }
}

