//
//  PersonTests.swift
//  GoT
//
//  Created by Pedro Sánchez Castro on 14/7/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import XCTest
@testable import GoT
class PersonTest: XCTestCase {
    
    let starkURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Stark")!
    let lannisterURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Lannister")!
    let targaryenURL = URL(string: "http://awoiaf.westeros.org/index.php/House_Targaryen")!
    
    var starkImage: UIImage!
    var lannisterImage : UIImage!
    
    var starkHouse : House!
    var lannisterHouse : House!
    
    var starkSigil : Sigil!
    var lannisterSigil : Sigil!
    
    var robb : Person!
    var arya : Person!
    var tyrion : Person!
    var ned : Person!
    
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkSigil = Sigil(image: #imageLiteral(resourceName: "codeIsComing.png"), description:"Direwolf")
        starkHouse = House(name: "Stark", sigil:starkSigil, words: "Winter is coming", url: starkURL)
        
        ned = Person(name: "Eddard", alias:"Ned", house :starkHouse)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        starkImage = #imageLiteral(resourceName: "codeIsComing.png")
        lannisterImage = #imageLiteral(resourceName: "lannister.jpg")
        
        starkSigil = Sigil(image: starkImage, description: "Direwolf")
        lannisterSigil = Sigil(image: lannisterImage, description: "Rampant Lions")
        
        starkHouse = House(name: "Stark", sigil: starkSigil, words: "Winter is coming", url: starkURL)
        lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Hear me roar!", url: lannisterURL)
        
        robb = Person (name: "Robb", alias: "The young wolf", house:starkHouse)
        arya = Person (name: "Arya", house: starkHouse)
        tyrion = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCharacterExistence(){
        
        let ned = Person(name: "Eddard", alias: "Ned", house: starkHouse)
        XCTAssertNotNil(ned)
        
    }
    
    func testFullName(){
        XCTAssertEqual(ned.fullName, "Eddard Stark")
    }
    
    func testPersonEquality() {
        
        //Identidad
        XCTAssertEqual(tyrion, tyrion)
        
        //Igualdad
        let imp = Person(name: "Tyrion", alias: "The Imp", house: lannisterHouse)
        
        XCTAssertEqual(tyrion, imp)
        
        //Desigualdad
        
        XCTAssertNotEqual(tyrion, ned)
        
    }
    
}

