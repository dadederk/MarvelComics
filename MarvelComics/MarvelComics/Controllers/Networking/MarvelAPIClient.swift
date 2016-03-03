//
//  NetworkingManager.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 02/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import Foundation
import BothamNetworking
import CryptoSwift

enum OrderBy: String {
    case onsaleAscending = "-onsaleDate", onsaleDescending = "onsaleDate"
}

struct MarvelAPIClient {

    static private let baseURL = "http://gateway.marvel.com:80/v1/public/"
    static private let comicsEndPoint = "/comics"
    
    private struct MarvelAPIParams {
        static let timestamp = "ts"
        static let apiKey = "apikey"
        static let hash = "hash"
        static let offset = "offset"
        static let orderBy = "orderBy"
    }
    
    static func comics(index:Int = 0, orderBy: OrderBy = OrderBy.onsaleAscending, completion:([Comic]) -> ()) {
        
        let apiClient = BothamAPIClient(baseEndpoint: baseURL)
        var params = basicParams()
        
        params.appendDictionary([MarvelAPIParams.offset: "\(index)",
            MarvelAPIParams.orderBy: "-onsaleDate"])
        
        apiClient.GET(comicsEndPoint, parameters: params) { result -> () in
            result.mapJSON({ json in
                dispatch_async(dispatch_get_main_queue(), {
                    completion(MarvelAPIParser.parseComics(json))
                })
            })
        }
    }
    
    static func basicParams() -> [String: String]{
    
        let apiKey = MarvelAPIConfig.apiKey
        let timestamp = NSDate.timeIntervalSinceReferenceDate()
        let hash = "\(timestamp)\(MarvelAPIConfig.privateKey)\(apiKey)".md5()
        
        return [MarvelAPIParams.timestamp: "\(timestamp)",
            MarvelAPIParams.apiKey: apiKey,
            MarvelAPIParams.hash: hash]
    }
}