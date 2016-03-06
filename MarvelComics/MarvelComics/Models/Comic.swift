//
//  Comic.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import UIKit

class Comic {
    let title: String
    let imageURL: String
    var customCover: UIImage?
    
    init(title: String, imageURL: String) {
    
        self.title = title
        self.imageURL = imageURL
    }
}