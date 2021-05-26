//
//  HomeTableViewController.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 26/05/21.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let listNews: [CategoryNews] = CategoryData().getListCategory()
    var viewController: ViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        print( CategoryData().getData(listNews.first?.rawValue ?? ""))
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "news-screen" {
            viewController = segue.destination as? ViewController
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listNews.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let previousCell = tableView.dequeueReusableCell(withIdentifier: "new-category", for: indexPath) as? HomeTableViewCell
        guard let cell = previousCell else { return HomeTableViewCell()}
        cell.setValues(listNews[indexPath.row].rawValue)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.titleWindow = CategoryData().getData(listNews[indexPath.row].rawValue)[0]
        viewController?.request = RequestAPI(listNews[indexPath.row])
    }

}
