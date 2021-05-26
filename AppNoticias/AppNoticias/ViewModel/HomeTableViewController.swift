//
//  HomeTableViewController.swift
//  AppNoticias
//
//  Created by Jonattan Moises Sousa on 26/05/21.
//

import UIKit

class HomeTableViewController: UITableViewController {

    let listNews: [CategoryNews] = [.TECNOLOGIA, .CIENCIA, .ESPORTE, .TURISMO]
    override func viewDidLoad() {
        super.viewDidLoad()
        print( CategoryData().getData(listNews.first?.rawValue ?? ""))
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
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
        let telaNoticias = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "list-news-screen") as? ViewController
        guard let tela = telaNoticias else { return }
        tela.category = listNews[indexPath.row]
        tela.modalPresentationStyle = .fullScreen
        present(tela, animated: true, completion: nil)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
