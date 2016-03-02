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

struct MarvelAPIClient {

    static private let baseURL = "http://gateway.marvel.com:80/v1/public/"
    static private let comicsEndPoint = "/comics"
    
    private struct MarvelAPIParams {
        static let timestamp = "ts"
        static let apiKey = "apikey"
        static let hash = "hash"
    }
    
    static func comics() {
        
        let apiClient = BothamAPIClient(baseEndpoint: baseURL)
        apiClient.GET(comicsEndPoint, parameters: basicParams()) { result -> () in
            result.mapJSON({ json in
                print(json)
            })
        }
    }
    
    static func basicParams() -> [String: String]{
    
        let apiKey = MarvelAPIConfig.apiKey
        let timestamp = NSDate.timeIntervalSinceReferenceDate()
        let hash = "\(timestamp)\(MarvelAPIConfig.privateKey)\(apiKey)".md5()
        
        return [MarvelAPIParams.timestamp: "\(timestamp)", MarvelAPIParams.apiKey: apiKey, MarvelAPIParams.hash: hash]
    }
}