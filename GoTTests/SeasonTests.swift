//
//  SeasonTests.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 24/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import XCTest

@testable import GoT
class SeasonTests: XCTestCase {
    
    let seasons = Repository.local.seasons
    
    var anySeason : Season!
    var anyEpisode : Episode!
    
    
    override func setUp() {
        super.setUp()
        anyEpisode = Episode(title: "Any episode", emmisionDate: Date.createDate(day: 17, month: 4, year: 2011))
        anySeason  = Season(name: "Season 1", episodes: [anyEpisode], premiereDate: Date.createDate(day: 23, month: 12, year: 2012))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSeasonExistence(){
        
        XCTAssertNotNil(anySeason)
    }
    
    func testAddEpisode(){
        let season1 = Repository.local.season(named: "Season 1")
        XCTAssertEqual(season1?.count, 2)
    }
    
    func testEquality(){
        //name & date
        let season1 = Repository.local.season(named: "Season 1")
        XCTAssertEqual(season1, season1)
        
    }
    
    func testHashable(){
        XCTAssertNotNil(anySeason.hashValue)
    }

    func testComparison(){
        XCTAssertLessThan(Repository.local.season(named:"Season 1")!,
                             Repository.local.season(named: "Season 2")!)
        
    }
    
}
