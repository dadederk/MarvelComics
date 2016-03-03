//
//  ViewController.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dataSource: ArrayDataSource!
    var configureCell: ConfigureCell!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCell = {(cell, item) in
            if let comic = item as? Comic,
                let comicCell = cell as? ComicCell {
                    comicCell.titleLabel.text = comic.title
            }
        }
        
        self.tableView.hidden = true;
        self.initialLoading()
    }
    
    func initialLoading() {
    
        MarvelAPIClient.comics(orderBy:OrderBy.onsaleDescending) { comics -> () in
            
            if let comics = comics {
                
                self.dataSource = ArrayDataSource(
                    items: comics,
                    cellReuseIdentifier: String(ComicCell),
                    configureCell: self.configureCell)
                
                self.tableView?.dataSource = self.dataSource
                self.tableView.reloadData()
                
                self.activityIndicator.stopAnimating()
            } else {
                
                print("Error getting comics")
            }
            
            self.tableView.hidden = false;
        }
    }
}

