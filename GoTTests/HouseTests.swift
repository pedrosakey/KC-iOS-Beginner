//
//  GoTTests.swift
//  GoTTests
//
//  Created by Pedro Sánchez Castro on 14/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import XCTest
@testable import GoT

class HouseTests: XCTestCase {
    
    let houses = Repository.local.houses
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    let starkURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
    let lannisterURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!
    let targaryenURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Targaryen")!
    

    override func setUp() {
        super.setUp()
        starkHouse = Repository.local.house(named: "Stark")
        lannisterHouse = Repository.local.house(named: "Lannister")
        }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testHouseExistence(){
        
        XCTAssertNotNil(starkHouse)
    }
    
    func testSigilExistence(){
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        XCTAssertNotNil(starkSigil)
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "Rampant Lion")
        XCTAssertNotNil(lannisterSigil)
    }
    
    func testAddPersons(){
        XCTAssertEqual(starkHouse.count,2)
        
        XCTAssertEqual(lannisterHouse.count,4)
    }
    
    func testHouseEquality(){
        
        //Identidad
        XCTAssertEqual(starkHouse, starkHouse)
        
        //Igualdad
        let starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description: "Direwolf")
        let jinxed = House(name: "Stark", sigil: starkSigil, words: "Winter is coming!", url: starkURL)
        
        XCTAssertEqual(jinxed, starkHouse)
        
        //Desigualdad
        XCTAssertNotEqual(starkHouse, lannisterHouse)
    }
    
    func testHashable() {
        XCTAssertNotNil(starkHouse.hashValue)
    }
    
    func testHouseComparison(){
        XCTAssertLessThan(lannisterHouse, starkHouse)
    }
    
    
}
