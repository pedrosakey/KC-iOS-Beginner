//
//  RepositoryTests.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 16/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import XCTest
@testable import GoT

class RepositoryTests: XCTestCase {
    
    var localHouses : [House]!
    var anyHouse : House!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
         localHouses = Repository.local.houses
         anyHouse = localHouses.last
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLocalRepositoryCreation(){
        XCTAssertNotNil(Repository.local)
    }
    
    func testLocalRespositoryHousesCreation(){
        let houses = Repository.local.houses
        XCTAssertNotNil(houses)
        XCTAssertEqual(houses.count, 2)
        
    }
    
    func testLocalRepositoryOrderedHouses () {
        XCTAssertEqual(localHouses,localHouses.sorted())
    }
    
    func testLocalRespositoryHouseByName () {
        
        XCTAssertEqual(anyHouse, Repository.local.house(named: (anyHouse?.name)!))
        
        //not equal
    }
    
   /* func testHousesfilteredBy () {
        
        let house = localHouses.filter({$0.name == anyHouse.name})
        // By name
        XCTAssertEqual(anyHouse, house )
        
        // By house
       // XCTAssertEqual(anyHouse, localHouses.filter({$0 == anyHouse}))
        
    }*/
    
    func testHousefiltering(){
        let filtered = Repository.local.houses(filteredBy: {$0.count == 4})
        XCTAssertEqual(filtered.count, 1)
    }
    
}
