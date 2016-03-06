//
//  ComicTests.swift
//  MarvelComics
//
//  Created by Daniel Devesa Derksen-Staats on 05/03/2016.
//  Copyright © 2016 Desfici. All rights reserved.
//

import XCTest

class ComicTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testComicInitValuesSetProperly() {
        
        let expectedTitle = "My Comic"
        let expectedImageUrl = "http://someurl.com"
        let comic = Comic(title: expectedTitle, imageURL: expectedImageUrl)
        
        XCTAssertEqual(comic.title, expectedTitle, "The title in the comic should be the expected title")
        XCTAssertEqual(comic.imageURL, expectedImageUrl, "The image url in the comic should be the expected image url")
    }
}
