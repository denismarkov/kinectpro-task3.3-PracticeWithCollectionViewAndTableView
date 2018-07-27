//
//  TableViewController.swift
//  PracticeWithCollectionViewAndTableView
//
//  Created by Denis Markov on 7/27/18.
//  Copyright © 2018 Denis Markov. All rights reserved.
//

import UIKit

protocol DataViewControllerDelegate {
    func didSelectNews(news: NewsModel)
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    final let newsArray = NewsData().newsArray
    
    var delegate: DataViewControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? TableViewCell else {
            return UITableViewCell()
        }
        let cellData = newsArray[indexPath.row]
        let cellTitle = "News #\(cellData.number ?? "Default title")"
        cell.initCell(image: cellData.imageName, title: cellTitle, description: cellData.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        delegate?.didSelectNews(news: newsArray[indexPath.row])
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

}
