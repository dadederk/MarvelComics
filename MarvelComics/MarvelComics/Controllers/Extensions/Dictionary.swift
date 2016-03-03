//
//  Dictionary.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 03/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation


extension Dictionary {

    mutating func appendDictionary(otherDictionary: Dictionary) {
    
        for (key, value) in otherDictionary {
        
            self[key] = value
        }
    }
}