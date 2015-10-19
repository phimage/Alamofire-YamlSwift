//
//  Alamofire_YamlSwiftTests.swift
//  Alamofire-YamlSwiftTests
//
//  Created by phimage on 19/10/15.
//  Copyright © 2015 phimage. All rights reserved.
//

import XCTest
@testable import AlamofireYamlSwift
import YamlSwift
import Alamofire

class Alamofire_YamlSwiftTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testYaml() {
        let expt = self.expectationWithDescription("yaml")
        
        Alamofire.request(.GET, "https://raw.githubusercontent.com/phimage/Prephirences/master/.travis.yml").responseYaml { (response:Response<Yaml, NSError>) -> Void in
            XCTAssert(response.result.value?.count > 0, "")
            
            print("\(response.result.value)")
            
            expt.fulfill()
        }
        
        self.waitForExpectationsWithTimeout(4, handler: nil)
    }
    
}