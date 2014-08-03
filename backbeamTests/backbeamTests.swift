//
//  backbeamTests.swift
//  backbeamTests
//
//  Created by James Tang on 28/7/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

// Our test cases: https://gist.github.com/gimenete/37a77b7b72d15b6065a3

import UIKit
import XCTest

class backbeamTests: XCTestCase {

    let request = BBBackbeamRequest()

    override func setUp() {
        super.setUp()

        request.secret = "pro_d2483cadbe4018c2603d9ba8993663f42134ed455e5e7ffdb7c8573218d323b3cfe7d50d1c6a371f"
        request.key = "pro_3ae5e79bb30c58501b88d81e7bb23ae6440aef2a"
        request.method = "POST"
        request.nonce = "6303cd9bf27d27eb6343427ac42365b38b09f112"
        request.path = "/user/email/login"
        request.time = "1397166331409"
        request.optionals["email"] = "user@example.com"
        request.optionals["password"] = "foobarbaz"
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCanonicalString() {
        XCTAssertEqual(request.canonical(), "email=user@example.com&key=pro_3ae5e79bb30c58501b88d81e7bb23ae6440aef2a&method=POST&nonce=6303cd9bf27d27eb6343427ac42365b38b09f112&password=foobarbaz&path=/user/email/login&time=1397166331409", "Must be same")
    }

    func testQueryString() {
        XCTAssertEqual(request.query(), "email=user@example.com&key=pro_3ae5e79bb30c58501b88d81e7bb23ae6440aef2a&nonce=6303cd9bf27d27eb6343427ac42365b38b09f112&password=foobarbaz&time=1397166331409", "Must be same")
    }

    func testSignature() {
        XCTAssertEqual(request.signature(), "ipzB9/s8GthdC4e6JVv5EwUOm6Y=", "Must be same")
    }

}
