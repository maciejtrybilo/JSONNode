//
//  JSONNodeTests.swift
//  JSONNodeTests
//
//  Created by Keith Moon on 09/11/2016.
//  Copyright © 2016 Keith Moon. All rights reserved.
//

import XCTest
@testable import JSONNode

class JSONNodeTests: XCTestCase {
    
    var rootJSON: JSONNode!
    
    override func setUp() {
        super.setUp()
        
        let bundle = Bundle(for: JSONNodeTests.self)
        let dataURL = bundle.url(forResource: "Test", withExtension: "json")!
        let jsonData = try! Data(contentsOf: dataURL)
        rootJSON = try! JSONNode(data: jsonData)
    }
    
    override func tearDown() {
        rootJSON = nil
        super.tearDown()
    }
    
    func testCanReadString() {
        
        let node = rootJSON["string"]
        
        guard let string = node.string else {
            XCTFail()
            return
        }
        XCTAssertEqual(string, "This is a string")
    }
    
    func testCanReadInt() {
        
        let node = rootJSON["int"]
        
        guard let int = node.integer else {
            XCTFail()
            return
        }
        XCTAssertEqual(int, 5)
    }
    
    func testCanReadFloatingPoint() {
        
        let node = rootJSON["floatingPoint"]
        
        guard let floatingPoint = node.floatingPoint else {
            XCTFail()
            return
        }
        XCTAssertEqual(floatingPoint, 3.14)
    }
    
    func testCanReadBool() {
        
        let node = rootJSON["bool"]
        
        guard let bool = node.boolean else {
            XCTFail()
            return
        }
        XCTAssertEqual(bool, true)
    }
    
    func testCanReadArray() {
        
        let node = rootJSON["array"]
        
        guard let array = node.array else {
            XCTFail()
            return
        }
        
        let expected: [JSONNode] = [.string("arrayValue1"), .string("arrayValue2"), .string("arrayValue3")]
        XCTAssertEqual(array, expected)
    }
    
    func testCanReadDictionary() {
        
        let node = rootJSON["dictionary"]
        
        guard let dictionary = node.dictionary else {
            XCTFail()
            return
        }
        
        let expected: [String: JSONNode] = ["key1": .string("value1"), "key2": .string("value2"), "key3": .string("value3")]
        XCTAssertEqual(dictionary, expected)
    }
    
}
