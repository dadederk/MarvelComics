//
//  DataSource.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 03/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import UIKit

typealias ConfigureCell = (cell: AnyObject, item: AnyObject?) -> (Void)

class DataSource: NSObject {
    
    let cellReuseIdentifier: String
    let configureCell: ConfigureCell
    
    init(cellReuseIdentifier: String, configureCell: ConfigureCell) {
        self.cellReuseIdentifier = cellReuseIdentifier
        self.configureCell = configureCell
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> AnyObject? {
        return nil
    }
    
    func indexPathForItem(item: AnyObject) -> NSIndexPath? {
        return nil
    }
}

extension DataSource : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier, forIndexPath: indexPath)
        let item = itemAtIndexPath(indexPath)
        configureCell(cell: tableViewCell, item: item)
        return tableViewCell
    }
}