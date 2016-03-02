//
//  File.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation

struct MarvelAPIConfig {

    static var apiKey: String {
    
        return configurationValueForKey("ApiKey") as! String
    }
    
    static var privateKey: String {
    
        return configurationValueForKey("PrivateKey") as! String
    }
    
    static func configurationValueForKey(key: String) -> AnyObject? {
        
        var value: AnyObject?
        var configuration: NSDictionary?
        
        if let path = NSBundle.mainBundle().pathForResource(String(MarvelAPIConfig), ofType: "plist") {
            
            configuration = NSDictionary(contentsOfFile: path)
        }
        
        if let configuration = configuration {
            
            value = configuration.objectForKey(key)!
        }
        
        return value;
    }
}