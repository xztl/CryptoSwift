//
//  Poly1305Tests.swift
//  CryptoSwift
//
//  Created by Marcin Krzyzanowski on 29/08/14.
//  Copyright (c) 2014 Marcin Krzyzanowski. All rights reserved.
//
import XCTest
@testable import CryptoSwift

final class Poly1305Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    
    func testPoly1305() {
        let key:Array<UInt8> = [0xdd,0xde,0xdf,0xe0,0xe1,0xe2,0xe3,0xe4,0xe5,0xe6,0xe7,0xe8,0xe9,0xea,0xeb,0xec,0xed,0xee,0xef,0xf0,0xf1,0xf2,0xf3,0xf4,0xf5,0xf6,0xf7,0xf8,0xf9,0xfa,0xfb,0xfc]
        let msg:Array<UInt8> = [0x79,0x7a,0x7b,0x7c,0x7d,0x7e,0x7f,0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8a,0x8b,0x8c,0x8d,0x8e,0x8f,0x90,0x91,0x92,0x93,0x94,0x95,0x96,0x97,0x98,0x99,0x9a,0x9b,0x9c,0x9d,0x9e,0x9f,0xa0,0xa1,0xa2,0xa3,0xa4,0xa5,0xa6,0xa7,0xa8,0xa9,0xaa,0xab,0xac,0xad,0xae,0xaf,0xb0,0xb1,0xb2,0xb3,0xb4,0xb5,0xb6,0xb7,0xb8,0xb9,0xba,0xbb,0xbc,0xbd,0xbe,0xbf,0xc0,0xc1]
        let expectedMac:Array<UInt8> = [0xdd,0xb9,0xda,0x7d,0xdd,0x5e,0x52,0x79,0x27,0x30,0xed,0x5c,0xda,0x5f,0x90,0xa4]
        
        let mac = try! Authenticator.Poly1305(key: key).authenticate(msg)
        XCTAssertEqual(mac, expectedMac, "Invalid authentication result")
        
        // extensions
        let msgData = NSData.withBytes(msg)
        let mac2 = try! msgData.authenticate(Authenticator.Poly1305(key: key))
        XCTAssertEqual(mac2, NSData.withBytes(expectedMac), "Invalid authentication result")
    }
}
