//
//  ViewController.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var dataSource: ArrayDataSource!
    var configureCell: ConfigureCell!
    var comics: [Comic] = []
    let fileImageManager = FileImageManager()
    
    var selectedIndex: NSIndexPath!
    var customCovers = [String]()
    let imagePickerController = UIImagePickerController()
    
    var fetchingData = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureCell = {(cell, item) in
            if let comic = item as? Comic,
                let comicCell = cell as? ComicCell {
            
                    let placeholderImage = UIImage(named: "Logo")
                    
                    comicCell.titleLabel.text = comic.title
                    
                    if self.customCovers.contains(comic.title) {
                        if let image = self.fileImageManager.imageWithName(comic.title) {
                            comicCell.coverImageView.image = image
                        }
                    } else {
                        comicCell.coverImageView.sd_setImageWithURL(NSURL(string: comic.imageURL), placeholderImage:placeholderImage)
                    }
            }
        }
        
        self.tableView.hidden = true
        self.tableView.delegate = self
        
        self.initialLoading()
    }
    
    func initialLoading() {
    
        self.getComics {
            self.activityIndicator.stopAnimating()
            self.tableView.hidden = false
        }
    }
    
    func getComics(completion:() -> ()) {
    
        guard self.fetchingData else {
            self.fetchingData = true
            
            MarvelAPIClient.comics(self.comics.count, orderBy:OrderBy.onsaleDescending) { comics -> () in
                
                self.fetchingData = false
                
                if let comics = comics {
                    self.loadComics(comics)
                    completion()
                } else {
                    print("Error getting comics")
                }
            }
            return
        }
    }
    
    func loadComics(comics: [Comic]) {
    
        self.comics = self.comics + comics
        
        self.dataSource = ArrayDataSource(
            items: self.comics,
            cellReuseIdentifier: String(ComicCell),
            configureCell: self.configureCell)
        
        self.tableView?.dataSource = self.dataSource
        self.tableView.reloadData()
    }
    
    func isLastCellWithIndexPath(index:NSIndexPath) -> Bool {
        return index.row == self.comics.count - 1
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if self.isLastCellWithIndexPath(indexPath) {
            self.getComics{}
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if (UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera) != nil) {
            self.imagePickerController.delegate = self
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
            
            self.selectedIndex = indexPath
            
            self.presentViewController(self.imagePickerController, animated: true) {}
        }
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.dismissViewControllerAnimated(true) {
        
            let filePath = self.fileImageManager.saveImage(image, name: self.comics[self.selectedIndex.row].title)
            
            if let _ = filePath {
                self.customCovers.append(self.comics[self.selectedIndex.row].title)
                
                self.tableView.beginUpdates()
                self.tableView.reloadRowsAtIndexPaths([self.selectedIndex], withRowAnimation: UITableViewRowAnimation.Automatic)
                self.tableView.endUpdates()
            }
        }
    }
}