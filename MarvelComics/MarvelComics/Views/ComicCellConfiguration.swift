//
//  ComicCellConfiguration.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 05/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import UIKit

extension ComicCell {

    func configureComicCell(comic:Comic) {
    
        self.titleLabel.text = comic.title
        
        if let customCover = comic.customCover {
            self.coverImageView.image = customCover
        } else {
            let placeholderImage = UIImage(named: "Logo")
            self.coverImageView.sd_setImageWithURL(NSURL(string: comic.imageURL), placeholderImage:placeholderImage)
        }
    }
    
    func changeComicCellImage(image: UIImage) {
        self.coverImageView.image = image
    }
}