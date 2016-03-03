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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let configureCell: ConfigureCell = {(cell, item) in
            if let comic = item as? Comic,
                let comicCell = cell as? ComicCell {
                    comicCell.titleLabel.text = comic.title
            }
        }
        
        MarvelAPIClient.comics { comics -> () in
            
                self.dataSource = ArrayDataSource(
                    items: comics,
                    cellReuseIdentifier: String(ComicCell),
                    configureCell: configureCell)
                
                self.tableView?.dataSource = self.dataSource
                self.tableView.reloadData()
        }
    }
}

