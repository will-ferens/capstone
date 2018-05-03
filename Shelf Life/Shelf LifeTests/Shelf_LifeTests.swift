//
//  Shelf_LifeTests.swift
//  Shelf LifeTests
//
//  Created by Will Ferens on 5/2/18.
//  Copyright © 2018 Will Ferens. All rights reserved.
//

import XCTest
@testable import Shelf_Life

class Shelf_LifeTests: XCTestCase {
    //MARK: Book Class Tests
    
    func testBookInitSuccess(){
        
        let anna = Book.init(title: "Anna Karenina", author: "Leo Tolstoy", cover: nil)
        
        XCTAssertNotNil(anna)
        
    
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
