//
//  EpisodeTests.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 24/8/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import XCTest
@testable import GoT

class EpisodeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFullDescription(){
       let  s1e1FullDescription : String = "Winter Is Coming Season 1"
       let  s1 = Repository.local.season(named: "Season 1")!
       let  s1episodes = s1.sortedEpisodes()
        XCTAssertEqual(s1episodes[0].fullDescription, s1e1FullDescription)
    }
}
