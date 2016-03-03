//
//  MarvelAPIParser.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import SwiftyJSON

struct MarvelAPIParser {

    static func parseComics(json: SwiftyJSON.JSON) -> [Comic] {
        
        var comics: [Comic] = []
        let data = json["data"]
        
        for comic in data["results"].arrayValue {
            
            let title = comic["title"].stringValue
            let thumbnail = comic["thumbnail"].dictionaryValue
            let imageURL = (thumbnail["path"]!.stringValue) + "." + (thumbnail["extension"]!.stringValue)
            
            comics.append(Comic(title:title, imageURL:imageURL))
        }
        
        return comics
    }
}