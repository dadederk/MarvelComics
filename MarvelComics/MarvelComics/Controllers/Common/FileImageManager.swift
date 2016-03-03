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
    
    func saveImage(image: UIImage, name: String) -> String? {
        
        var filePath: String?
        
        if let data = UIImageJPEGRepresentation(image, 0.8) {
            filePath = getDocumentsDirectory().stringByAppendingPathComponent("\(name).jpg")
            data.writeToFile(filePath!, atomically: true)
        }
        
        return filePath
    }
    
    func imageWithName(name: String) -> UIImage? {
    
        let filePath = getDocumentsDirectory().stringByAppendingPathComponent("\(name).jpg")
        
        return UIImage(contentsOfFile: filePath)
    }
    
    func getDocumentsDirectory() -> NSString {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        
        return documentsDirectory
    }
}