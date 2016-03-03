//
//  ArratDataSource.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 03/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import UIKit

class ArrayDataSource: DataSource {
    
    var items: [AnyObject]
    
    init(items: [AnyObject], cellReuseIdentifier: String, configureCell: ConfigureCell) {
        self.items = items
        super.init(cellReuseIdentifier: cellReuseIdentifier, configureCell: configureCell)
    }
    
    override func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return items[indexPath.row]
    }
    
    override func indexPathForItem(item: AnyObject) -> NSIndexPath? {
        var indexPath: NSIndexPath? = nil
        if let row: Int? = (items as NSArray).indexOfObject(item) {
            indexPath = NSIndexPath(forRow: row!, inSection: 0)
        }
        return indexPath
    }
    
    // MARK: UITableViewDataSource
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}