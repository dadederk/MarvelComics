//
//  FileImageManager.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 03/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import UIKit

struct FileImageManager {
    
    static func saveImage(image: UIImage, name: String, quality: CGFloat) -> String? {
        
        var filePath: String?
        
        if let data = UIImageJPEGRepresentation(image, quality) {
            filePath = getDocumentsDirectory().stringByAppendingPathComponent("\(name).jpg")
            data.writeToFile(filePath!, atomically: true)
        }
        
        return filePath
    }
    
    static func imageWithName(name: String) -> UIImage? {
    
        let filePath = getDocumentsDirectory().stringByAppendingPathComponent("\(name).jpg")
        
        return UIImage(contentsOfFile: filePath)
    }
    
    static func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        
        return documentsDirectory
    }
}